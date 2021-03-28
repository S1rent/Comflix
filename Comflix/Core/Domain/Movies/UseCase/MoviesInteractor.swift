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
}
