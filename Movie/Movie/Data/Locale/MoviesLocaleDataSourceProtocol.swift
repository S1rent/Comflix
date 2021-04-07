//
//  MoviesLocaleDataSourceProtocol.swift
//  Movie
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import Combine

public protocol MoviesLocaleDataSourceProtocol {
    func getTrendingMovies() -> AnyPublisher<[MovieEntity], Error>
    func addMovies(with movies: [MovieEntity]) -> AnyPublisher<Bool, Error>
    func getAvailableMovies() -> AnyPublisher<[MovieEntity], Error>
    func getRandomMovie() -> AnyPublisher<[MovieEntity], Error>
    func getMovieDetail(id: Int) -> AnyPublisher<[MovieEntity], Error>
    func updateFavoriteMovie(with id: Int) -> AnyPublisher<Bool, Error>
    func getFavoriteMovies() -> AnyPublisher<[MovieEntity], Error>
}
