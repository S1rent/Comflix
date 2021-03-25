//
//  ProfileInjection.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation

final class ProfileInjection: NSObject {
    private func provideDataSource() -> ProfileDataSourceProtocol {
        return ProfileDataSource()
    }
    
    private func provideRepository() -> ProfileRepositoryProtocol {
        return ProfileRepository(dataSource: provideDataSource())
    }
    
    private func provideUseCase() -> ProfileUseCase {
        return ProfileInteractor(repository: provideRepository())
    }
}
