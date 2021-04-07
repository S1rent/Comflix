//
//  MoviesRemoteDataSourceProtocol.swift
//  Movie
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import Combine

public protocol MoviesRemoteDataSourceProtocol {
    func getTrendingMovies() -> AnyPublisher<[MovieResponse], Error>
    func getAvailableNowMovies() -> AnyPublisher<[MovieResponse], Error>
    func getRandomMovie() -> AnyPublisher<[MovieResponse], Error>
    func getMovieDetail(id: Int) -> AnyPublisher<[MovieResponse], Error>
}
