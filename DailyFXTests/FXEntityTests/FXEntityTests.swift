//
//  FXEntityTests.swift
//  DailyFXTests
//
//  Created by Catherine on 08/11/21.
//

import XCTest
@testable import DailyFX

class FXEntityTests: XCTestCase {

    func testFXEntitySetGet() {
        let news = FXNews(title: "title", url: "url", description: "description", headlineImageUrl: "https://a.c-dn.net/b/1ycfch/headline_NYSE_12.JPG")
        let region = FXRegionNews(eu: [news], asia: [news], us: [news])
        let fx = FX(breakingNews: [news], topNews: [news], dailyBriefings: region, technicalAnalysis:[ news], specialReport: [news])
        XCTAssertEqual(fx.breakingNews?.first?.title, "title")
        XCTAssertEqual(fx.breakingNews?.first?.url, "url")
        XCTAssertEqual(fx.breakingNews?.first?.description, "description")
    }
}
