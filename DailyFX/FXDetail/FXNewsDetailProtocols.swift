//
//  FXNewsDetailProtocols.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

protocol FXNewsDetailViewToPresenterProtocol {
    func setTitle() -> String
}

protocol FXNewsDetailPresenterToViewProtocol: AnyObject { }

protocol FXNewsDetailPresenterToInteractorProtocol { }

protocol FXNewsDetailInteractorToPresenterProtocol: class { }

protocol FXNewsDetailPresenterToRouterProtocol { }
