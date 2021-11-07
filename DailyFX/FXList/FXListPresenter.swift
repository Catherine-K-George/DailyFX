//
//  FXListPresenter.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

class FXListPresenter: NSObject {
    weak var view: FXListPresenterToViewProtocol?
    var interactor: FXListPresenterToInteractorProtocol?
    var router: FXListPresenterToRouterProtocol?
}

extension FXListPresenter: FXListViewToPresenterProtocol { }

extension FXListPresenter: FXListInteractorToPresenterProtocol { }
