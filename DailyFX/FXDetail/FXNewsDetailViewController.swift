//
//  FXNewsDetailViewController.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXNewsDetailViewController: UIViewController {

    var presenter: FXNewsDetailViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Detail")
    }
}

// MARK: - FXNewsDetailViewToPresenter
extension FXNewsDetailViewController: FXNewsDetailPresenterToViewProtocol { }
