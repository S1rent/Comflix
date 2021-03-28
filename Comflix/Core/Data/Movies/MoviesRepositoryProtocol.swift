//
//  MoviesRepositoryProtocol.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import Combine

protocol MoviesRepositoryProtocol {
    func getTrendingMovies() -> AnyPublisher<[MovieModel], Error>
}
