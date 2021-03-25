//
//  ProfileInteractor.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation
import Combine

class ProfileInteractor: ProfileUseCase {
    
    private let repository: ProfileRepositoryProtocol
    
    required init(repository: ProfileRepositoryProtocol) {
        self.repository = repository
    }
    
    func getProfileData() -> AnyPublisher<ProfileModel, Error> {
        return self.repository.getProfileData()
    }
}
