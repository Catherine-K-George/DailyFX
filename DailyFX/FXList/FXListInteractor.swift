//
//  FXListInteractor.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

class FXListInteractor: NSObject {
    weak var presenter: FXListInteractorToPresenterProtocol?
    
    private func fetchFXList() {
        ServiceHandler.makeRequest(responseType: FX.self) { [weak self] (result) in
            switch result {
            case .success(let fxNews):
                self?.presenter?.didFetch(fx: fxNews)
            case .failure(let error):
                self?.presenter?.didFail(error.localizedDescription)
            }
        }
    }
}

// MARK: - FXListPresenterToInteractor
extension FXListInteractor: FXListPresenterToInteractorProtocol {
    func fetchList() {
        fetchFXList()
    }
}
