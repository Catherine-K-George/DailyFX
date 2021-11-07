//
//  FXCategoryTableViewCell.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXCategoryTableViewCell: UITableViewCell {

    static let identifier = "FXCategoryTableViewCell"
    var fxNews: [FXNews] = []
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
