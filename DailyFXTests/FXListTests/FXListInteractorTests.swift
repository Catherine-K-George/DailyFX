//
//  FXListInteractorTests.swift
//  DailyFXTests
//
//  Created by Catherine on 09/11/21.
//

import XCTest
@testable import DailyFX

class FXListInteractorTests: XCTestCase {

    func testFetchAPI() {
        
        let expectation = XCTestExpectation.init(description: "FX news")
        
        ServiceHandler.makeRequest(responseType: FX.self) { (result) in
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
