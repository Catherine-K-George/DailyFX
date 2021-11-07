//
//  FXListProtocols.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation


protocol FXListViewToPresenterProtocol {
    func fetchList()
    func numberOfSections() -> Int
    func numberOfRows(Insection section: Int) -> Int
    func item(for indexPath: IndexPath) -> [FXNews]
}

protocol FXListPresenterToViewProtocol: AnyObject {
    func reloadUI()
    func showFailed(_ message: String)
}

protocol FXListPresenterToInteractorProtocol {
    func fetchList()
}

protocol FXListInteractorToPresenterProtocol: class {
    func didFetch(fx data: FX)
    func didFail(_ message: String)
}

protocol FXListPresenterToRouterProtocol { }
