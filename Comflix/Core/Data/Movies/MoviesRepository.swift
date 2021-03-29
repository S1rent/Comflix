//
//  MoviesRepository.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import Combine
import RealmSwift

final class MoviesRepository: NSObject {
    typealias MovieInstance = (
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

    static let shared: MovieInstance = { localeRepo, remoteRepo in
        return MoviesRepository(
            localeDataSource: localeRepo,
            remoteDataSource: remoteRepo
        )
    }
}

extension MoviesRepository: MoviesRepositoryProtocol {
    func getTrendingMovies() -> AnyPublisher<[MovieModel], Error> {
        
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
    
    func getAvailableMovies() -> AnyPublisher<[MovieModel], Error> {
        
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
    
    func getRandomMovie() -> AnyPublisher<[MovieModel], Error> {
        
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
    }
}
