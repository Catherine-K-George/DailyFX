//
//  FXNewsDetailViewController.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXNewsDetailViewController: UIViewController {

    var presenter: FXNewsDetailViewToPresenterProtocol?
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        presenter?.setBannerImage()
        populateDataInUI()
    }
    
    private func populateDataInUI() {
        guard let news = presenter?.setNewsDetails() else { return }
        titleLabel.text = news.title
        descriptionLabel.text = news.description
    }

    private func setNavigation() {
        title = presenter?.setTitle()
    }
    
    @IBAction func shareMoreTapped(_ sender: UIButton) {
        guard let urlString = presenter?.setNewsDetails()?.url, let url = URL(string: urlString) else { return }
        guard UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

// MARK: - FXNewsDetailViewToPresenter
extension FXNewsDetailViewController: FXNewsDetailPresenterToViewProtocol {
    func didLoad(_ image: UIImage) {
        bannerImageView.image = image
    }
    
    func didFail(_ error: Error) {
        print("Image Error", error)
    }
}
