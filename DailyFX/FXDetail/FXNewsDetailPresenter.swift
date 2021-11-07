//
//  FXNewsDetailPresenter.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

class FXNewsDetailPresenter: NSObject {
    weak var view: FXNewsDetailPresenterToViewProtocol?
    var interactor: FXNewsDetailPresenterToInteractorProtocol?
    var router: FXNewsDetailPresenterToRouterProtocol?
    var fxNews: FXNews?
}

// MARK: - FXNewsDetailViewToPresenter
extension FXNewsDetailPresenter: FXNewsDetailViewToPresenterProtocol { }

// MARK: - FXNewsDetailInteractorToPresenter
extension FXNewsDetailPresenter: FXNewsDetailInteractorToPresenterProtocol { }
