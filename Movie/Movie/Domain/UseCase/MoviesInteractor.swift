//
//  MoviesInteractor.swift
//  Movie
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import Combine

public class MoviesInteractor: MoviesUseCase {
    public let repository: MoviesRepositoryProtocol
    
    public required init(
        repository: MoviesRepositoryProtocol
    ) {
        self.repository = repository
    }
    
    public func getTrendingMovies() -> AnyPublisher<[MovieModel], Error> {
        return repository.getTrendingMovies()
    }
    
    public func getAvailableMovies() -> AnyPublisher<[MovieModel], Error> {
        return repository.getAvailableMovies()
    }
    
    public func getRandomMovie() -> AnyPublisher<[MovieModel], Error> {
        return repository.getRandomMovie()
    }
    
    public func getMovieDetail(id: Int) -> AnyPublisher<[MovieModel], Error> {
        return repository.getMovieDetail(id: id)
    }
    
    public func updateFavoriteMovie(with id: Int) -> AnyPublisher<Bool, Error> {
        return repository.updateFavoriteMovie(with: id)
    }
    
    public func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error> {
        return repository.getFavoriteMovies()
    }
}
