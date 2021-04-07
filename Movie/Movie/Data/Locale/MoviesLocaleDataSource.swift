import Foundation
import RealmSwift
import Combine
import Core

public class MoviesLocaleDataSource: NSObject {
    public  let realm: Realm?

    private init(realm: Realm?) {
        self.realm = realm
    }

    public static let shared: (Realm?) -> MoviesLocaleDataSource = { realmDatabase in
        return MoviesLocaleDataSource(realm: realmDatabase)
    }
}

extension MoviesLocaleDataSource: MoviesLocaleDataSourceProtocol {
    public func getTrendingMovies() -> AnyPublisher<[MovieEntity], Error> {
        return Future<[MovieEntity], Error> { completion in
            if let realm = self.realm {
                let movies: Results<MovieEntity> = {
                    realm.objects(MovieEntity.self)
                    .filter("displayType='trending'")
                }()
                completion(
                    .success(
                        movies.toArray(
                            fromType: MovieEntity.self
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
    
    public func addMovies(with movies: [MovieEntity]) -> AnyPublisher<Bool, Error> {
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
    
    public func getAvailableMovies() -> AnyPublisher<[MovieEntity], Error> {
        return Future<[MovieEntity], Error> { completion in
            if let realm = self.realm {
                let movies: Results<MovieEntity> = {
                    realm.objects(MovieEntity.self)
                        .filter(
                            "displayType='\(MovieEntityDisplayTypeEnum.availableNow.rawValue)'"
                        )
                }()
                completion(
                    .success(
                        movies.toArray(
                            fromType: MovieEntity.self
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
    
    public func getRandomMovie() -> AnyPublisher<[MovieEntity], Error> {
        return Future<[MovieEntity], Error> { completion in
            if let realm = self.realm {
                let movies: Results<MovieEntity> = {
                    realm.objects(MovieEntity.self)
                        .filter(
                            "displayType='\(MovieEntityDisplayTypeEnum.randomMovie.rawValue)'"
                        )
                }()
                completion(
                    .success(
                        movies.toArray(
                            fromType: MovieEntity.self
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
    
    public func getMovieDetail(id: Int) -> AnyPublisher<[MovieEntity], Error> {
        return Future<[MovieEntity], Error> { completion in
            if let realm = self.realm {
                let movies: Results<MovieEntity> = {
                    realm.objects(MovieEntity.self)
                    .filter("movieID=\(id)")
                }()
                completion(
                    .success(
                        movies.toArray(
                            fromType: MovieEntity.self
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
    
    public func updateFavoriteMovie(with id: Int) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    let favoriteItem = realm.objects(MovieEntity.self)
                        .filter(
                            "movieID=\(id)"
                        )
                    
                    if favoriteItem.isEmpty {
                        completion(
                            .success(false)
                        )
                    } else {
                        guard let newItem = favoriteItem.first
                        else {
                            return completion(
                                .failure(
                                    DatabaseErrorEnum.errorRequestFailed
                                )
                            )
                        }
                        
                        try realm.write {
                            newItem.isFavorite = newItem.isFavorite == 0 ? 1 : 0
                            realm.add(newItem, update: .all)
                        }
                        
                        return completion(
                            .success(
                                true
                            )
                        )
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
    
    public func getFavoriteMovies() -> AnyPublisher<[MovieEntity], Error> {
        return Future<[MovieEntity], Error> { completion in
            if let realm = self.realm {
                let movies: Results<MovieEntity> = {
                    realm.objects(MovieEntity.self)
                    .filter("isFavorite=1")
                }()
                completion(
                    .success(
                        movies.toArray(
                            fromType: MovieEntity.self
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
}
