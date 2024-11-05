//
//  NetworkManager.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchWords(cmcontinue: String? = nil, completion: @escaping (Result<([WordData], String?), Error>) -> Void) {
        let apiEndpoint = "https://en.wiktionary.org/w/api.php"
        var urlComponents = URLComponents(string: apiEndpoint)!
        urlComponents.queryItems = [
            URLQueryItem(name: "action", value: "query"),
            URLQueryItem(name: "list", value: "categorymembers"),
            URLQueryItem(name: "cmtitle", value: "Category:Proto-Germanic lemmas"),
            URLQueryItem(name: "cmlimit", value: "100"),
            URLQueryItem(name: "format", value: "json")
        ]
        
        if let cmcontinue = cmcontinue {
//            print("Using cmcontinue: \(cmcontinue)")
            urlComponents.queryItems?.append(URLQueryItem(name: "cmcontinue", value: cmcontinue))
        } else {
            print("No cmcontinue provided, starting from the beginning.")
        }

        let request = URLRequest(url: urlComponents.url!)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "NoData", code: 1, userInfo: nil)))
                }
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                if let query = json["query"] as? [String: Any],
                   let categoryMembers = query["categorymembers"] as? [[String: Any]] {
                    // Parse the words
                    let wordsData = categoryMembers.compactMap { WordData(json: $0) }

                    // Get the continuation token
                    let continueDict = json["continue"] as? [String: Any]
                    let nextCmcontinue = continueDict?["cmcontinue"] as? String
//                    print("Received next cmcontinue: \(nextCmcontinue ?? "nil")")

                    DispatchQueue.main.async {
                        completion(.success((wordsData, nextCmcontinue)))
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(NSError(domain: "InvalidData", code: 1, userInfo: nil)))
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }

        task.resume()
    }
    
    func fetchWordDetails(title: String, completion: @escaping (Result<String, Error>) -> Void) {
        let apiEndpoint = "https://en.wiktionary.org/w/api.php"
        var urlComponents = URLComponents(string: apiEndpoint)!
        urlComponents.queryItems = [
            URLQueryItem(name: "action", value: "query"),
            URLQueryItem(name: "prop", value: "revisions"),
            URLQueryItem(name: "rvprop", value: "content"),
            URLQueryItem(name: "rvslots", value: "main"),
            URLQueryItem(name: "titles", value: title),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "redirects", value: "1")
        ]

        let request = URLRequest(url: urlComponents.url!)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: 1, userInfo: nil)))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                if let query = json["query"] as? [String: Any],
                   let pages = query["pages"] as? [String: Any],
                   let page = pages.values.first as? [String: Any],
                   let revisions = page["revisions"] as? [[String: Any]],
                   let content = revisions.first?["slots"] as? [String: Any],
                   let mainSlot = content["main"] as? [String: Any],
                   let contentString = mainSlot["*"] as? String {
                    
                    completion(.success(contentString)) // Return the content as a String here
                } else {
                    completion(.failure(NSError(domain: "InvalidData", code: 1, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }


    
    func fetchAllWordsWithDetails(completion: @escaping (Result<[WordData], Error>) -> Void) {
        var allWordsData = [WordData]()
        let dispatchGroup = DispatchGroup() // To manage concurrent detail fetches

        // Recursive function to fetch all data in batches
        func fetchNextBatch(cmcontinue: String?) {
            fetchWords(cmcontinue: cmcontinue) { result in
                switch result {
                case .success(let (wordsData, nextCmcontinue)):
                    allWordsData.append(contentsOf: wordsData)
                    
                    // For each word, enter the dispatch group to fetch details concurrently
                    for wordData in wordsData {
                        dispatchGroup.enter()
                        self.fetchWordDetails(title: wordData.title) { detailResult in
                            switch detailResult {
                            case .success(let detailedContent): // Now detailedContent is a String
                                let parsedData = WiktionaryParser.parse(content: detailedContent)
                                if let index = allWordsData.firstIndex(where: { $0.pageid == wordData.pageid }) {
                                    // Update with parsed details
                                    allWordsData[index].wordType = parsedData.wordType
                                    allWordsData[index].translations = parsedData.translations
                                }
                            case .failure(let error):
                                print("Error fetching details for \(wordData.title): \(error)")
                            }
                            dispatchGroup.leave()
                        }
                    }

                    // Wait for all details to be fetched before continuing with the next batch
                    dispatchGroup.notify(queue: .main) {
                        if let nextCmcontinue = nextCmcontinue {
                            fetchNextBatch(cmcontinue: nextCmcontinue)
                        } else {
                            // Log total words fetched for verification
                            print("Total words with details fetched: \(allWordsData.count)")
                            
                            // Complete the process
                            DispatchQueue.main.async {
                                completion(.success(allWordsData))
                            }
                        }
                    }

                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }

        // Start the recursive fetch process
        fetchNextBatch(cmcontinue: nil)
    }

}


// Helper struct to parse word data
struct WordData {
    let pageid: Int64
    let title: String
    var wordType: WordType
    var translations: [String] // Stores translations

    init(pageid: Int64, title: String, wordType: WordType, translations: [String]) {
        self.pageid = pageid
        self.title = title
        self.wordType = wordType
        self.translations = translations
    }
    
    // Optional initializer for JSON parsing
    init?(json: [String: Any]) {
        guard let pageid = json["pageid"] as? Int64,
              let title = json["title"] as? String else {
            return nil
        }
        self.pageid = pageid
        self.title = title
        self.wordType = .unknown // Default to unknown; will populate later
        self.translations = [] // Initialize empty, populate with actual translations
    }
}
