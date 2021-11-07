//
//  FXListRouter.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXListRouter: NSObject {
    weak var presentedViewController: UIViewController?
    static let viewIdentifier = StoryboardIdentifier.FXList
    weak var presenter: FXListPresenter?

    static func createModule() -> FXListViewController? {
        let view = UIStoryboard(name: StoryboardIdentifier.FXList, bundle: nil).instantiateViewController(withIdentifier: viewIdentifier) as? FXListViewController

        let presenter = FXListPresenter()
        view?.presenter = presenter
        presenter.view = view

        let interactor = FXListInteractor()
        presenter.interactor = interactor
        interactor.presenter = presenter

        let router = FXListRouter()
        presenter.router = router
        router.presentedViewController = view
        router.presenter = presenter
        return view
    }
}

// MARK: - FXListPresenterToRouter
extension FXListRouter: FXListPresenterToRouterProtocol { }
