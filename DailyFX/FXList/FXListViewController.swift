//
//  FXListViewController.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXListViewController: UIViewController {
    var presenter: FXListViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension FXListViewController: FXListPresenterToViewProtocol { }
