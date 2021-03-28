//
//  MoviesInjection.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import RealmSwift

final class MoviesInjection: NSObject {
  
    private func provideRepository() -> MoviesRepositoryProtocol {
        let realm = try? Realm()

        let localeDataSource: MoviesLocaleDataSource = MoviesLocaleDataSource.shared(realm)
        let remoteDataSource: MoviesRemoteDataSource = MoviesRemoteDataSource.shared

        return MoviesRepository.shared(
            localeDataSource,
            remoteDataSource
        )
    }

    func provideMovies() -> MoviesUseCase {
        let repository = provideRepository()
        return MoviesInteractor(
            repository: repository
        )
    }
}
