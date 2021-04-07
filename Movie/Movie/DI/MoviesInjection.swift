//
//  MoviesInjection.swift
//  Movie
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import RealmSwift

public final class MoviesInjection: NSObject {
    private func provideRepository() -> MoviesRepositoryProtocol {
        let realm = try? Realm()

        let localeDataSource: MoviesLocaleDataSource = MoviesLocaleDataSource.shared(realm)
        let remoteDataSource: MoviesRemoteDataSource = MoviesRemoteDataSource.shared

        return MoviesRepository.shared(
            localeDataSource,
            remoteDataSource
        )
    }

    public func provideMovies() -> MoviesUseCase {
        let repository = provideRepository()
        return MoviesInteractor(
            repository: repository
        )
    }
}
