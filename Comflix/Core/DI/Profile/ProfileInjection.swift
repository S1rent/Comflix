//
//  ProfileInjection.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation

final class ProfileInjection: NSObject {
    
    private func provideRepository() -> ProfileRepositoryProtocol {
        let dataSource: ProfileDataSource = ProfileDataSource.shared
        return ProfileRepository.shared(dataSource)
    }
    
    func provideUseCase() -> ProfileUseCase {
        return ProfileInteractor(repository: provideRepository())
    }
}
