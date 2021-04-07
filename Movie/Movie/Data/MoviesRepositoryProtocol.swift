//
//  MoviesRepositoryProtocol.swift
//  Movie
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import Combine

public protocol MoviesRepositoryProtocol {
    func getTrendingMovies() -> AnyPublisher<[MovieModel], Error>
    func getAvailableMovies() -> AnyPublisher<[MovieModel], Error>
    func getRandomMovie() -> AnyPublisher<[MovieModel], Error>
    func getMovieDetail(id: Int) -> AnyPublisher<[MovieModel], Error>
    func updateFavoriteMovie(with id: Int) -> AnyPublisher<Bool, Error>
    func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error>
}
