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
        registerCells()
        presenter?.fetchList()
    }
    
    private func registerCells() {
        fxCategoryTableView.register(UINib(nibName: FXCategoryHeaderView.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: FXCategoryHeaderView.identifier)
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FXCategoryHeaderView.identifier) as! FXCategoryHeaderView
        header.delegate = self
        header.section = section
        header.title = presenter?.title(for: section) ?? ""
        return header
    }
}

// MARK: TableViewDataSource
extension FXListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.numberOfSections() ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows(Insection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FXCategoryTableViewCell.identifier, for: indexPath) as! FXCategoryTableViewCell
        cell.delegate = self
        cell.fxNews = presenter?.item(for: indexPath) ?? []
        return cell
    }

}

// MARK: FXCategoryTableViewCellDelegate
extension FXListViewController: FXCategoryTableViewCellDelegate {
    func didSelect(_ news: FXNews) {
        presenter?.navigate(toDetail: news)
    }
}

// MARK: FXCategoryHeaderViewDelegate
extension FXListViewController: FXCategoryHeaderViewDelegate {
    func showAllFXNews(at section: Int) {
        presenter?.showAllFXNews(at: section)
    }
}
