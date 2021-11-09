//
//  FXListRouterTests.swift
//  DailyFXTests
//
//  Created by Catherine on 08/11/21.
//

import XCTest
@testable import DailyFX

class FXListRouterTests: XCTestCase {
    var fxListRouter: FXListRouter!
    static let viewIdentifier = StoryboardIdentifier.FXList

    override func setUp() {
        super.setUp()
        let view = UIStoryboard(name: StoryboardIdentifier.FXList, bundle: nil).instantiateViewController(withIdentifier: FXListRouterTests.viewIdentifier) as? FXListViewController
        fxListRouter = FXListRouter()
        fxListRouter.presentedViewController = view
        
    }

    func testTopVCIsFXDetailWhenPresented() {
        let news = FXNews(title: "title", url: "url", description: "description")
        fxListRouter.navigateToFXDetail(news)
        XCTAssertTrue(fxListRouter.presentedViewController is FXListViewController)
    }
}
