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

// MARK: - FXListViewToPresenter
extension FXListPresenter: FXListViewToPresenterProtocol {
    func fetchList() {
        interactor?.fetchList()
    }
}

// MARK: - FXListInteractorToPresenter
extension FXListPresenter: FXListInteractorToPresenterProtocol {
    func didFetch(fx data: FX) {
        view?.didFetch(fx: data)
    }

    
    func didFail(_ message: String) {
        view?.didFail(message)
    }
}
