//
//  FXListProtocols.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation


protocol FXListViewToPresenterProtocol {
//    func search(repositoryBy username: String)
//    func navigateToDetail(_ repository: Repository)
}

protocol FXListPresenterToViewProtocol: AnyObject {
//    func didRepositorySearchFinish(with results: [Repository])
//    func didFail(_ message: String)
}

protocol FXListPresenterToInteractorProtocol {
//    func requestSearch(repositoryBy username: String)
}

protocol FXListInteractorToPresenterProtocol: class {
//    func didRepositorySearchFinish(with results: [Repository])
//    func didFail(_ message: String)
}

protocol FXListPresenterToRouterProtocol {
//    func navigateToDetails(_ repository: Repository)
}
