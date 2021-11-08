//
//  FXCategoryHeaderView.swift
//  DailyFX
//
//  Created by Catherine on 08/11/21.
//

import UIKit

protocol FXCategoryHeaderViewDelegate: AnyObject {
    func showAllFXNews(at section: Int)
}

class FXCategoryHeaderView: UITableViewHeaderFooterView {

    static let identifier = "FXCategoryHeaderView"
    weak var delegate: FXCategoryHeaderViewDelegate?
    var section: Int?
    var title: String = "" {
        didSet {
            configure()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func showAllAction(_ sender: UIButton) {
        guard let section = section else { return }
        delegate?.showAllFXNews(at: section)
    }
    
    func configure() {
        titleLabel.text = title
    }
}

