//
//  MoviesInteractor.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import Combine

class MoviesInteractor: MoviesUseCase {
    
    let repository: MoviesRepositoryProtocol
    
    required init(
        repository: MoviesRepositoryProtocol
    ) {
        self.repository = repository
    }
    
    func getTrendingMovies() -> AnyPublisher<[MovieModel], Error> {
        return repository.getTrendingMovies()
    }
    
    func getAvailableMovies() -> AnyPublisher<[MovieModel], Error> {
        return repository.getAvailableMovies()
    }
    
    func getRandomMovie() -> AnyPublisher<[MovieModel], Error> {
        return repository.getRandomMovie()
    }
    
    func getMovieDetail(id: Int) -> AnyPublisher<[MovieModel], Error> {
        return repository.getMovieDetail(id: id)
    }
    
    func updateFavoriteMovie(with id: Int) -> AnyPublisher<Bool, Error> {
        return repository.updateFavoriteMovie(with: id)
    }
}
