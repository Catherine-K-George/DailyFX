//
//  NetworkError.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

enum NetworkError: Error, LocalizedError, Equatable {
    case invalidURL
    case invalidData
    case parseError
    case invalidImage
}
