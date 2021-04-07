//
//  GetMoviesRepository.swift
//  Movie
//
//  Created by IT Division on 07/04/21.
//

import Combine
import RealmSwift

public class MoviesRepository: NSObject {
    public typealias MovieInstance = (
        MoviesLocaleDataSource,
        MoviesRemoteDataSource
    ) -> MoviesRepository

    fileprivate let remoteDataSource: MoviesRemoteDataSource
    fileprivate let localeDataSource: MoviesLocaleDataSource

    private init(
        localeDataSource: MoviesLocaleDataSource,
        remoteDataSource: MoviesRemoteDataSource
    ) {
        self.localeDataSource = localeDataSource
        self.remoteDataSource = remoteDataSource
    }

    public static let shared: MovieInstance = { localeRepo, remoteRepo in
        return MoviesRepository(
            localeDataSource: localeRepo,
            remoteDataSource: remoteRepo
        )
    }
}

extension MoviesRepository: MoviesRepositoryProtocol {
    public func getTrendingMovies() -> AnyPublisher<[MovieModel], Error> {
        
        return self.localeDataSource.getTrendingMovies()
            .flatMap { result -> AnyPublisher<[MovieModel], Error> in
            if result.isEmpty {
                return self.remoteDataSource.getTrendingMovies()
                .map {
                    MoviesMapper.mapMovieResponseToEntities(
                        input: $0,
                        displayType: MovieEntityDisplayTypeEnum.trending.rawValue
                    )
                }
                .flatMap { self.localeDataSource
                    .addMovies(
                        with: $0
                    )
                }
                .filter { $0 }
                    .flatMap { _ in self.localeDataSource.getTrendingMovies()
                        .map {
                        MoviesMapper.mapMovieEntitiesToDomains(
                            input: $0
                        )
                    }
                }
                .eraseToAnyPublisher()
            } else {
                return self.localeDataSource.getTrendingMovies()
                .map {
                    MoviesMapper.mapMovieEntitiesToDomains(
                        input: $0
                    )
                }
                .eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
    
    public func getAvailableMovies() -> AnyPublisher<[MovieModel], Error> {
        
        return self.localeDataSource.getAvailableMovies()
            .flatMap { result -> AnyPublisher<[MovieModel], Error> in
            if result.isEmpty {
                return self.remoteDataSource.getAvailableNowMovies()
                .map {
                    MoviesMapper.mapMovieResponseToEntities(
                        input: $0,
                        displayType: MovieEntityDisplayTypeEnum.availableNow.rawValue
                    )
                }
                .flatMap { self.localeDataSource
                    .addMovies(
                        with: $0
                    )
                }
                .filter { $0 }
                    .flatMap { _ in self.localeDataSource.getAvailableMovies()
                        .map {
                        MoviesMapper.mapMovieEntitiesToDomains(
                            input: $0
                        )
                    }
                }
                .eraseToAnyPublisher()
            } else {
                return self.localeDataSource.getAvailableMovies()
                .map {
                    MoviesMapper.mapMovieEntitiesToDomains(
                        input: $0
                    )
                }
                .eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
    
    public func getRandomMovie() -> AnyPublisher<[MovieModel], Error> {
        
        if Reachability.shared.isNetworkAvailable() {
            return self.remoteDataSource.getRandomMovie()
                .flatMap { result -> AnyPublisher<[MovieModel], Error> in
                    if result.isEmpty {
                        return self.localeDataSource
                        .getRandomMovie()
                        .map {
                            MoviesMapper.mapMovieEntitiesToDomains(input: $0)
                        }.eraseToAnyPublisher()
                    } else {
                        return self.remoteDataSource.getRandomMovie()
                        .map {
                            MoviesMapper.mapMovieResponseToEntities(
                                input: $0,
                                displayType: MovieEntityDisplayTypeEnum.randomMovie.rawValue
                            )
                        }
                        .flatMap {
                            self.localeDataSource
                            .addMovies(
                                with: $0
                            )
                        }
                        .filter { $0 }
                        .flatMap { _ in self.localeDataSource.getRandomMovie()
                            .map {
                                MoviesMapper.mapMovieEntitiesToDomains(
                                    input: $0
                                )
                            }
                        }
                        .eraseToAnyPublisher()
                    }
                }.eraseToAnyPublisher()
        } else {
            return self.localeDataSource
            .getTrendingMovies()
            .map {
                MoviesMapper.mapMovieEntitiesToDomains(input: $0)
            }.eraseToAnyPublisher()
        }
    }
    
    public func getMovieDetail(id: Int) -> AnyPublisher<[MovieModel], Error> {
        return self.localeDataSource.getMovieDetail(id: id)
            .flatMap { result -> AnyPublisher<[MovieModel], Error> in
            if result.isEmpty {
                return self.remoteDataSource.getMovieDetail(id: id)
                .map {
                    MoviesMapper.mapMovieResponseToEntities(
                        input: $0,
                        displayType: MovieEntityDisplayTypeEnum.randomMovie.rawValue
                    )
                }
                .flatMap { self.localeDataSource
                    .addMovies(
                        with: $0
                    )
                }
                .filter { $0 }
                    .flatMap { _ in self.localeDataSource.getMovieDetail(id: id)
                        .map {
                        MoviesMapper.mapMovieEntitiesToDomains(
                            input: $0
                        )
                    }
                }
                .eraseToAnyPublisher()
            } else {
                return self.localeDataSource.getMovieDetail(id: id)
                .map {
                    MoviesMapper.mapMovieEntitiesToDomains(
                        input: $0
                    )
                }
                .eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
    
    public func updateFavoriteMovie(with id: Int) -> AnyPublisher<Bool, Error> {
        return self.localeDataSource.updateFavoriteMovie(with: id).eraseToAnyPublisher()
    }
    
    public func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error> {
        return self.localeDataSource.getFavoriteMovies()
        .map {
            MoviesMapper.mapMovieEntitiesToDomains(input: $0)
        }.eraseToAnyPublisher()
    }
}
