//
//  FXNewsDetailPresenter.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXNewsDetailPresenter: NSObject {
    weak var view: FXNewsDetailPresenterToViewProtocol?
    var interactor: FXNewsDetailPresenterToInteractorProtocol?
    var router: FXNewsDetailPresenterToRouterProtocol?
    var fxNews: FXNews?
}

// MARK: - FXNewsDetailViewToPresenter
extension FXNewsDetailPresenter: FXNewsDetailViewToPresenterProtocol {
    func setNewsDetails() -> FXNews? {
        return fxNews
    }
    
    func setBannerImage() {
        guard let urlString = fxNews?.headlineImageUrl else { return }
        guard let url = URL(string: urlString) else { return  }
        interactor?.loadImage(from: url)
    }
    
    func setTitle() -> String {
        fxNews?.title ?? ""
    }
}

// MARK: - FXNewsDetailInteractorToPresenter
extension FXNewsDetailPresenter: FXNewsDetailInteractorToPresenterProtocol {
    func didLoad(_ image: UIImage) {
        view?.didLoad(image)
    }
    
    func didFail(_ error: Error) {
        view?.didFail(error)
    }
}
