//
//  FXDetailPresenterTests.swift
//  DailyFXTests
//
//  Created by Catherine on 09/11/21.
//

import XCTest
@testable import DailyFX

class FXDetailPresenterTests: XCTestCase {
    var fxDetailPresenter: FXNewsDetailPresenter!
    let news = FXNews(title: "title", url: "url", description: "description", headlineImageUrl: "https://a.c-dn.net/b/1ycfch/headline_NYSE_12.JPG")
    
    override func setUp() {
        super.setUp()
        fxDetailPresenter = FXNewsDetailPresenter()
        fxDetailPresenter.fxNews = news
    }
    
    func testGetNewsDetails() {
        let details = fxDetailPresenter.setNewsDetails()
        XCTAssertNotNil(details)
    }
    
    func testGetTitle() {
        let title = fxDetailPresenter.setTitle()
        XCTAssertNotNil(title)
    }
}
