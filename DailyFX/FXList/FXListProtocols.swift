//
//  FXListProtocols.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation


protocol FXListViewToPresenterProtocol {
    func fetchList()
}

protocol FXListPresenterToViewProtocol: AnyObject {
    func didFetch(fx data: FX)
    func didFail(_ message: String)
}

protocol FXListPresenterToInteractorProtocol {
    func fetchList()
}

protocol FXListInteractorToPresenterProtocol: class {
    func didFetch(fx data: FX)
    func didFail(_ message: String)
}

protocol FXListPresenterToRouterProtocol { }
