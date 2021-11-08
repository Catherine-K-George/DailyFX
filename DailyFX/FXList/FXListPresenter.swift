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
    private var modifiedFXCategories: [[String:[FXNews]]] = [[String:[FXNews]]]()
}

// MARK: - FXListViewToPresenter
extension FXListPresenter: FXListViewToPresenterProtocol {
    func showAllFXNews(at section: Int) {  }
    
    func navigate(toDetail news: FXNews) {
        router?.navigateToFXDetail(news)
    }
    
    func fetchList() {
        interactor?.fetchList()
    }
    
    func numberOfSections() -> Int {
        modifiedFXCategories.count
    }
    
    func numberOfRows(Insection section: Int) -> Int {
        1
    }
    
    func title(for section: Int) -> String {
        modifiedFXCategories[section].keys.first ?? ""
    }

    func item(for indexPath: IndexPath) -> [FXNews] {
        modifiedFXCategories[indexPath.section].values.first ?? []
    }
}

// MARK: - FXListInteractorToPresenter
extension FXListPresenter: FXListInteractorToPresenterProtocol {
    func didFetch(fx data: FX) {
        fxCategoryList = data
        if let breakingNews = fxCategoryList?.breakingNews, !breakingNews.isEmpty {
            modifiedFXCategories.append(["Breaking News": breakingNews])
        }
        if let topNews = fxCategoryList?.topNews, !topNews.isEmpty {
            modifiedFXCategories.append(["Top News": topNews])
        }
        if let specialReport = fxCategoryList?.specialReport, !specialReport.isEmpty {
            modifiedFXCategories.append(["Special Reports": specialReport])
        }
        if let technicalAnalysis = fxCategoryList?.technicalAnalysis, !technicalAnalysis.isEmpty {
            modifiedFXCategories.append(["Technical Analysis": technicalAnalysis])
        }
        view?.reloadUI()
    }

    
    func didFail(_ message: String) {
        view?.showFailed(message)
    }
}
