//
//  FXListPresenterTests.swift
//  DailyFXTests
//
//  Created by Catherine on 08/11/21.
//

import XCTest
@testable import DailyFX

class FXListPresenterTests: XCTestCase {
    var fxListPresenter: FXListPresenter!
    let news = FXNews(title: "title", url: "url", description: "description")
    var mockFX: FX {
        return FX(breakingNews: [news], topNews: [news], dailyBriefings: FXRegionNews(eu: [news], asia: [news], us: [news]), technicalAnalysis: [news], specialReport: [news])
    }
    
    override func setUp() {
        super.setUp()
        fxListPresenter = FXListPresenter()
    }
    
    func testGetNumberOfSections() {
        fxListPresenter.didFetch(fx: mockFX)
        let sections = fxListPresenter.numberOfSections()
        XCTAssertEqual(sections, 4)
    }
    
    func testGetNumberOfRowsInSection() {
        let rows = fxListPresenter.numberOfRows(Insection: 0)
        XCTAssertEqual(rows, 1)
    }
    
    func testGetTitle() {
        let section = 0
        fxListPresenter.didFetch(fx: mockFX)
        let title = fxListPresenter.title(for: section)
        XCTAssertEqual(title, "Breaking News")
    }

    func testGetItem() {
        let indexPath = IndexPath(row: 0, section: 0)
        fxListPresenter.didFetch(fx: mockFX)
        let item = fxListPresenter.item(for: indexPath)
        XCTAssertNotNil(item)
    }
}
