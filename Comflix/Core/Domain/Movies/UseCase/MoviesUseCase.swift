//
//  MoviesUseCase.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import Combine

protocol MoviesUseCase {
    func getTrendingMovies() -> AnyPublisher<[MovieModel], Error>
    func getAvailableMovies() -> AnyPublisher<[MovieModel], Error>
    func getRandomMovie() -> AnyPublisher<[MovieModel], Error>
    func getMovieDetail(id: Int) -> AnyPublisher<[MovieModel], Error>
    func updateFavoriteMovie(with id: Int) -> AnyPublisher<Bool, Error>
}
