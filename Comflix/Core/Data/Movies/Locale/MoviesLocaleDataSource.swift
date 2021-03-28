//
//  LocaleMoviesDataSource.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import RealmSwift
import Combine

final class MoviesLocaleDataSource: NSObject {

    private let realm: Realm?

    private init(realm: Realm?) {
        self.realm = realm
    }

    static let shared: (Realm?) -> MoviesLocaleDataSource = { realmDatabase in
        return MoviesLocaleDataSource(realm: realmDatabase)
    }
}

extension MoviesLocaleDataSource: MoviesLocaleDataSourceProtocol {
    func getTrendingMovies() -> AnyPublisher<[MovieEntity], Error> {
        return Future<[MovieEntity], Error> { completion in
            if let realm = self.realm {
                let movies: Results<MovieEntity> = {
                    realm.objects(MovieEntity.self)
                }()
                completion(
                    .success(
                        movies.toArray(
                            ofType: MovieEntity.self
                        )
                    )
                )
            } else {
                completion(
                    .failure(
                        DatabaseErrorEnum.errorInvalidInstance
                    )
                )
            }
        }.eraseToAnyPublisher()
    }
    
    func addTrendingMovies(with movies: [MovieEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for movie in movies {
                            realm.add(movie, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(
                        .failure(
                            DatabaseErrorEnum.errorRequestFailed
                        )
                    )
                }
            } else {
                completion(
                    .failure(
                        DatabaseErrorEnum.errorInvalidInstance
                    )
                )
            }
        }.eraseToAnyPublisher()
    }
}
