//
//  FXNewsDetailInteractor.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

class FXNewsDetailInteractor: NSObject {
    weak var presenter: FXNewsDetailInteractorToPresenterProtocol?
}

// MARK: - FXNewsDetailPresenterToInteractor
extension FXNewsDetailInteractor: FXNewsDetailPresenterToInteractorProtocol { }
