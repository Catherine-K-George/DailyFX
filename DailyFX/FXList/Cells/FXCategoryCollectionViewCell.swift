//
//  FXCategoryCollectionViewCell.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "FXCategoryCollectionViewCell"

    var fxNewsItem: FXNews? {
        didSet {
            configureFXNews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func configureFXNews() {
        guard let news = fxNewsItem else { return }
        titleLabel.text = news.title
        descriptionLabel.text = news.description
    }
}
