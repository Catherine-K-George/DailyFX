//
//  FXNewsDetailRouter.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXNewsDetailRouter: NSObject {
    weak var presentedViewController: UIViewController?
    static let viewIdentifier = StoryboardIdentifier.FXDetail
    weak var presenter: FXNewsDetailPresenter?

    static func createModule(with news: FXNews) -> FXNewsDetailViewController? {
        let view = UIStoryboard(name: StoryboardIdentifier.FXDetail, bundle: nil).instantiateViewController(withIdentifier: viewIdentifier) as? FXNewsDetailViewController

        let presenter = FXNewsDetailPresenter()
        presenter.fxNews = news
        view?.presenter = presenter
        presenter.view = view

        let interactor = FXNewsDetailInteractor()
        presenter.interactor = interactor
        interactor.presenter = presenter

        let router = FXNewsDetailRouter()
        presenter.router = router
        router.presentedViewController = view
        router.presenter = presenter
        return view
    }
}

// MARK: - FXListPresenterToRouter
extension FXNewsDetailRouter: FXNewsDetailPresenterToRouterProtocol { }
