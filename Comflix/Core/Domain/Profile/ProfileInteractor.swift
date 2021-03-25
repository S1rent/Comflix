//
//  ProfileInteractor.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation

class ProfileInteractor: ProfileUseCase {
    
    private let repository: ProfileRepositoryProtocol
    
    init(repository: ProfileRepositoryProtocol) {
        self.repository = repository
    }
    
    func getProfileData() -> ProfileEntity {
        return self.repository.getProfileData()
    }
}
