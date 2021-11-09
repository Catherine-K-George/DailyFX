//
//  FX.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

struct FX: Decodable {
    let breakingNews: [FXNews]?
    let topNews: [FXNews]?
    let dailyBriefings: FXRegionNews?
    let technicalAnalysis: [FXNews]?
    let specialReport: [FXNews]?
}

struct FXRegionNews: Decodable {
    let eu: [FXNews]?
    let asia: [FXNews]?
    let us: [FXNews]?
}

struct FXNews: Decodable {
    let title: String?
    let url: String?
    let description: String?
    let headlineImageUrl: String?
}
