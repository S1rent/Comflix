//
//  MoviesRemoteDataSourceProtocol.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import Combine

protocol MoviesRemoteDataSourceProtocol {
    func getTrendingMovies() -> AnyPublisher<[MovieResponse], Error>
}
