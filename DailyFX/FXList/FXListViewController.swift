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
        presenter?.fetchList()
    }
}

// MARK: - FXListPresenterToView
extension FXListViewController: FXListPresenterToViewProtocol {
    func didFetch(fx data: FX) {
        print("response", data)
    }
    
    func didFail(_ message: String) {
        print("error", message)
    }
}
