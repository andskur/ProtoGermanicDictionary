//
//  DataManagerTests.swift
//  ProtoGermanicDictionaryTests
//
//  Created by Andrey Skurlatov on 06/11/2024.
//

import XCTest
import CoreData
@testable import ProtoGermanicDictionary

class DataManagerTests: XCTestCase {
    var dataManager: DataManager!
    var context: NSManagedObjectContext!

    override func setUp() {
        super.setUp()
        
        // Set up an in-memory persistent container for testing
        let container = NSPersistentContainer(name: "ProtoGermanicDictionary")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]

        container.loadPersistentStores { _, error in
            XCTAssertNil(error)
        }

        context = container.viewContext
        dataManager = DataManager(persistentContainer: container)  // Use in-memory container
    }
    
    override func tearDown() {
        dataManager = nil
        context = nil
        super.tearDown()
    }
    
    // Test importing words and saving them to Core Data
    func testImportWords() {
        let wordsData = [
            WordData(pageid: 1, title: "word1", wordType: .noun, translations: ["translation1"]),
            WordData(pageid: 2, title: "word2", wordType: .verb, translations: ["translation2"]),
        ]
        
        let importExpectation = expectation(description: "Words imported")
        
        dataManager.importWords(wordsData) { error in
            XCTAssertNil(error)
            
            let fetchedWords = self.dataManager.fetchWords()
            XCTAssertEqual(fetchedWords.count, 2)
            XCTAssertEqual(fetchedWords[0].title, "word1")
            XCTAssertEqual(fetchedWords[0].translations?.count, 1)
            
            importExpectation.fulfill()
        }
        
        wait(for: [importExpectation], timeout: 5.0)
    }

    // Test fetching words with word type filter
    func testFetchWordsWithFilter() {
        // Create a word and save it to Core Data
        let word = Word(context: context)
        word.title = "testWord"
        word.wordType = WordType.noun.rawValue
        dataManager.saveContext()
        
        // Fetch only words of type noun
        let fetchedWords = dataManager.fetchWords(wordTypeFilter: .noun)
        XCTAssertEqual(fetchedWords.count, 1)
        XCTAssertEqual(fetchedWords[0].wordType, WordType.noun.rawValue)
    }

    // Test searching by title
    func testSearchWordsByTitle() {
        // Create word with title "searchTest"
        let word = Word(context: dataManager.context)
        word.title = "searchTest"
        word.sortTitle = word.title?.folding(options: .diacriticInsensitive, locale: .current)
        word.wordType = WordType.noun.rawValue
        dataManager.saveContext()

        // Perform search
        let searchResults = dataManager.fetchWords(searchText: "search")

        XCTAssertEqual(searchResults.count, 1, "Expected to find one matching word.")
        XCTAssertEqual(searchResults.first?.title, "searchTest", "Expected 'searchTest' as the search result title.")
    }


    // Test searching by translation text
    func testSearchWordsByTranslation() {
        // Create word and translation objects
        let word = Word(context: context)
        word.title = "testTranslationWord"
        let translation = Translation(context: context)
        translation.text = "specificTranslation"
        translation.word = word  // Properly set the relationship
        word.addToTranslations(translation)
        
        dataManager.saveContext()
        
        // Search for word by translation text
        let searchResults = dataManager.fetchWords(searchText: "specific")
        XCTAssertEqual(searchResults.count, 1)
        XCTAssertEqual(searchResults[0].title, "testTranslationWord")
    }
    
    // Test updating a word's translations and word type
    func testUpdateWordDetails() {
        let word = Word(context: context)
        word.title = "updateWord"
        dataManager.saveContext()
        
        // Update the word with new translations and word type
        dataManager.updateWord(word, with: ["newTranslation1", "newTranslation2"], wordType: .noun, nounGender: .neuter, nounStem: .aStem, verbClass: nil)
        
        let updatedWord = dataManager.fetchWordDetails(title: "updateWord")
        XCTAssertEqual(updatedWord?.translations?.count, 2)
        XCTAssertEqual(updatedWord?.wordType, WordType.noun.rawValue)
        XCTAssertEqual(updatedWord?.nounGender, NounGender.neuter.rawValue)
        XCTAssertEqual(updatedWord?.nounStem, NounStem.aStem.rawValue)
    }
    
    // Test saving and fetching a word by title
    // Test fetching word details
    func testFetchWordDetails() {
        let word = Word(context: context)
        word.title = "fetchWord"
        dataManager.saveContext()
        
        let fetchedWord = dataManager.fetchWordDetails(title: "fetchWord")
        XCTAssertNotNil(fetchedWord)
        XCTAssertEqual(fetchedWord?.title, "fetchWord")
    }
}
