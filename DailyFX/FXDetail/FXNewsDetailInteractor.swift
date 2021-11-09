//
//  FXNewsDetailInteractor.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

class FXNewsDetailInteractor: NSObject {
    weak var presenter: FXNewsDetailInteractorToPresenterProtocol?
}

// MARK: - FXNewsDetailPresenterToInteractor
extension FXNewsDetailInteractor: FXNewsDetailPresenterToInteractorProtocol {
    func loadImage(from url: URL) {
        ServiceHandler.loadImage(from: url) { [weak self] (result) in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.presenter?.didLoad(image)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.presenter?.didFail(error)
                }
            }
        }
    }
}
