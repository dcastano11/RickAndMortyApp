//
//  RickAndMortyAppTests.swift
//  RickAndMortyAppTests
//
//  Created by David Castaño on 26/09/23.
//

import XCTest
import Combine
@testable import RickAndMortyApp

final class RickAndMortyAppTests: XCTestCase {
    
    var store: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testCharacterRepo() throws {
        
        let expectation = self.expectation(description: "Data received")
        
        let repo = CharacterInfoUseCases()
        repo.getCharacterInfo(characterId: 1)
            .sink { completion in
            switch(completion){
            case .finished:
                break
            case .failure(let error):
                XCTFail("Failed: \(error)")
            }
            expectation.fulfill()
        }
        receiveValue: { value in
            XCTAssertNotNil(value)
    
        }.store(in: &store)
        
        waitForExpectations(timeout: 5)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
