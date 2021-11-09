//
//  FXNewsDetailProtocols.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

protocol FXNewsDetailViewToPresenterProtocol {
    func setTitle() -> String
    func setBannerImage()
    func setNewsDetails() -> FXNews?
}

protocol FXNewsDetailPresenterToViewProtocol: AnyObject {
    func didLoad(_ image: UIImage)
    func didFail(_ error: Error)
}

protocol FXNewsDetailPresenterToInteractorProtocol {
    func loadImage(from url: URL)
}

protocol FXNewsDetailInteractorToPresenterProtocol: class {
    func didLoad(_ image: UIImage)
    func didFail(_ error: Error)
}

protocol FXNewsDetailPresenterToRouterProtocol { }
