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
        var fxResponse: FX?
        
        ServiceHandler.makeRequest(responseType: FX.self) { [weak self] (result) in
            expectation.fulfill()
            switch result {
            case .success(let fxNews):
                fxResponse = fxNews
            case .failure(let error):
                XCTFail(error.localizedDescription)
                fxResponse = nil
            }
            DispatchQueue.main.async {
                self?.waitForExpectations(timeout: 20, handler: { (error) in
                    if let error = error {
                        XCTFail(error.localizedDescription)
                    } else {
                        XCTAssertNotNil(fxResponse)
                    }
                })
            }
            
        }
    }

}
