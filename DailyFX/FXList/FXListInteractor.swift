//
//  FXListInteractor.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

class FXListInteractor: NSObject {
    weak var presenter: FXListInteractorToPresenterProtocol?
    
}

extension FXListInteractor: FXListPresenterToInteractorProtocol { }
