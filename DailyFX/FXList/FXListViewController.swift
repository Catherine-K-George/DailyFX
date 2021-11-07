//
//  FXListViewController.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXListViewController: UIViewController {
    var presenter: FXListViewToPresenterProtocol?

    @IBOutlet weak var fxCategoryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchList()
    }
}

// MARK: - FXListPresenterToView
extension FXListViewController: FXListPresenterToViewProtocol {
    func reloadUI() {
        fxCategoryTableView.reloadData()
    }
    
    func showFailed(_ message: String) {
        print("Error", message)
    }
}

// MARK: TableViewDelegate
extension FXListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
}

// MARK: TableViewDataSource
extension FXListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows(Insection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FXCategoryTableViewCell.identifier, for: indexPath) as! FXCategoryTableViewCell
        cell.fxNews = presenter?.item(for: indexPath) ?? []
        return cell
    }

}
