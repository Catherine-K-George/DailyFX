//
//  FX.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

struct FX: Decodable {
//    let breakingNews: [FXNews]?
    let topNews: [FXNews]?
//    let dailyBriefings: [FXNews]?
//    let technicalAnalysis: [FXNews]?
//    let specialReport: [FXNews]?
}
struct FXNews: Decodable {
    let title: String?
    let url: String?
    let description: String?
}
