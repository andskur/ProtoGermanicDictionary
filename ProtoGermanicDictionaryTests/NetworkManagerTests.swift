//
//  NetworkManagerTests.swift
//  ProtoGermanicDictionaryTests
//
//  Created by Andrey Skurlatov on 06/11/2024.
//

import XCTest
@testable import ProtoGermanicDictionary

class NetworkManagerTests: XCTestCase {
    var networkManager: NetworkManager!
    var mockSession: URLSession!

    override func setUp() {
        super.setUp()
        
        // Create a mock session configuration and assign it to mockSession
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        mockSession = URLSession(configuration: configuration)
        
        // Initialize NetworkManager with the mock session
        networkManager = NetworkManager(session: mockSession)
    }

    override func tearDown() {
        networkManager = nil
        mockSession = nil
        super.tearDown()
    }


    // MARK: - Test fetchWords

    func testFetchWordsSuccess() {
        let expectation = self.expectation(description: "Fetch words succeeds")

        // Simulate successful response JSON
        let jsonData = """
        {
          "query": {
            "categorymembers": [
              {"pageid": 1, "title": "word1"},
              {"pageid": 2, "title": "word2"}
            ]
          }
        }
        """.data(using: .utf8)!
        
        // Create mock session and inject it into the NetworkManager
        let mockSession = createMockSession(data: jsonData, response: HTTPURLResponse(url: URL(string: "https://mockurl.com")!,
                                                                                      statusCode: 200, httpVersion: nil, headerFields: nil), error: nil)
        let networkManager = NetworkManager(session: mockSession) // Injected mock session
        
        networkManager.fetchWords(cmcontinue: nil) { result in
            switch result {
            case .success(let (wordsData, _)):
                XCTAssertEqual(wordsData.count, 2)
                XCTAssertEqual(wordsData[0].title, "word1")
                XCTAssertEqual(wordsData[1].title, "word2")
            case .failure:
                XCTFail("Expected success but got failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }


    func testFetchWordsFailure() {
        let expectation = self.expectation(description: "Fetch words fails")
        
        // Simulate network failure
        let mockError = NSError(domain: "TestDomain", code: -1, userInfo: nil)
        let mockSession = createMockSession(data: nil, response: nil, error: mockError)
        
        networkManager.fetchWords(cmcontinue: nil) { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual((error as NSError).domain, "TestDomain")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
    
    // MARK: - Test fetchWordDetails

    func testFetchWordDetailsSuccess() {
        let expectation = self.expectation(description: "Fetch word details succeeds")
        
        // Simulate successful response JSON
        let jsonData = """
        {
          "query": {
            "pages": {
              "1": {
                "revisions": [
                  {
                    "slots": {
                      "main": {
                        "*": "Mocked content for word details."
                      }
                    }
                  }
                ]
              }
            }
          }
        }
        """.data(using: .utf8)!

        let mockSession = createMockSession(data: jsonData, response: HTTPURLResponse(url: URL(string: "https://mockurl.com")!,
                                                                                      statusCode: 200, httpVersion: nil, headerFields: nil), error: nil)
        
        networkManager.fetchWordDetails(title: "mockWord") { result in
            switch result {
            case .success(let content):
                XCTAssertEqual(content, "Mocked content for word details.")
            case .failure:
                XCTFail("Expected success but got failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }

    func testFetchWordDetailsFailure() {
        let expectation = self.expectation(description: "Fetch word details fails")
        
        // Simulate network failure
        let mockError = NSError(domain: "TestDomain", code: -1, userInfo: nil)
        let mockSession = createMockSession(data: nil, response: nil, error: mockError)
        
        networkManager.fetchWordDetails(title: "mockWord") { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual((error as NSError).domain, "TestDomain")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
    
    // MARK: - Helper for Mocking URLSession

    private func createMockSession(data: Data?, response: URLResponse?, error: Error?) -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        MockURLProtocol.requestHandler = { _ in
            return (response, data, error)
        }
        return session
    }
}

// Mock URLProtocol
class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) -> (URLResponse?, Data?, Error?))?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("Request handler is unavailable.")
        }

        let (response, data, error) = handler(request)

        if let response = response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }

        if let data = data {
            client?.urlProtocol(self, didLoad: data)
        }

        if let error = error {
            client?.urlProtocol(self, didFailWithError: error)
        }

        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {
        // Required method for stopping requests, no-op here
    }
}
