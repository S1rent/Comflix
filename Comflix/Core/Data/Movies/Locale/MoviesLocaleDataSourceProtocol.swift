//
//  MoviesLocaleDataSourceProtocol.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import Combine

protocol MoviesLocaleDataSourceProtocol {
    func getTrendingMovies() -> AnyPublisher<[MovieEntity], Error>
    func addTrendingMovies(with movies: [MovieEntity]) -> AnyPublisher<Bool, Error>
}
