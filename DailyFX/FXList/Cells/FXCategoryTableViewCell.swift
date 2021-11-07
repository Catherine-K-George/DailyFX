//
//  FXCategoryTableViewCell.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

protocol FXCategoryTableViewCellDelegate: AnyObject {
    func didSelect(_ news: FXNews)
}

class FXCategoryTableViewCell: UITableViewCell {

    static let identifier = "FXCategoryTableViewCell"
    var fxNews: [FXNews] = []
    weak var delegate: FXCategoryTableViewCellDelegate?

    @IBOutlet weak var fxCategoryCollectionView: UICollectionView! {
        didSet {
            fxCategoryCollectionView.delegate = self
            fxCategoryCollectionView.dataSource = self
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

// MARK: CollectionViewDelegate
extension FXCategoryTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(fxNews[indexPath.row])
    }
}

// MARK: CollectionViewDataSource
extension FXCategoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fxNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FXCategoryCollectionViewCell.identifier, for: indexPath) as! FXCategoryCollectionViewCell
        cell.fxNewsItem = fxNews[indexPath.row]
        return cell
    }
    
}
