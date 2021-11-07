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
    private var fxCategoryList: FX?
}

// MARK: - FXListViewToPresenter
extension FXListPresenter: FXListViewToPresenterProtocol {
    func fetchList() {
        interactor?.fetchList()
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(Insection section: Int) -> Int {
        switch section {
        case 0:
            return fxCategoryList?.topNews?.count ?? 0
        default:
            return 0
        }
    }
    
    func item(for indexPath: IndexPath) -> [FXNews] {
        switch indexPath.section {
        case 0:
            return fxCategoryList?.topNews ?? []
        default:
            return []
        }
    }
}

// MARK: - FXListInteractorToPresenter
extension FXListPresenter: FXListInteractorToPresenterProtocol {
    func didFetch(fx data: FX) {
        fxCategoryList = data
        view?.reloadUI()
    }

    
    func didFail(_ message: String) {
        view?.showFailed(message)
    }
}
