//
//  ProfilePresenter.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    
    private let useCase: ProfileUseCase
    
    init(useCase: ProfileUseCase) {
        self.useCase = useCase
    }
    
    func getProfileData() -> ProfileEntity {
        return self.useCase.getProfileData()
    }
}
