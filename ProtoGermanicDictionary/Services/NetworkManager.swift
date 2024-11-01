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

    func fetchFirst100Words(completion: @escaping (Result<[[String: Any]], Error>) -> Void) {
        let apiEndpoint = "https://en.wiktionary.org/w/api.php"
        var urlComponents = URLComponents(string: apiEndpoint)!
        urlComponents.queryItems = [
            URLQueryItem(name: "action", value: "query"),
            URLQueryItem(name: "list", value: "categorymembers"),
            URLQueryItem(name: "cmtitle", value: "Category:Proto-Germanic lemmas"),
            URLQueryItem(name: "cmlimit", value: "100"),
            URLQueryItem(name: "format", value: "json")
        ]

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
                    DispatchQueue.main.async {
                        completion(.success(categoryMembers))
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
}
