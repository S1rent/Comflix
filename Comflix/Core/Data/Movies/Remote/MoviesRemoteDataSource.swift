//
//  MoviesRemoteDataSource.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import Combine
import Alamofire

final class MoviesRemoteDataSource {
    let baseURL = "https://api.themoviedb.org/3/"
    let apiKey = "93286dcb4bb910326e5e6607672a8685"
    static let shared: MoviesRemoteDataSource =  MoviesRemoteDataSource()
    
    private init() {}
}

extension MoviesRemoteDataSource: MoviesRemoteDataSourceProtocol {
    
    func getTrendingMovies() -> AnyPublisher<[MovieResponse], Error> {
        let parameters: Parameters = [
            "api_key": apiKey
        ]
        
        return Future<[MovieResponse], Error> { completion in
            if let requestURL = URL(
                string: self.baseURL+MoviesRemoteRequestEnum.getTrendingMovies.rawValue
            ) {
                AF.request(
                    requestURL,
                    method: .get,
                    parameters: parameters
                )
                .validate()
                .responseDecodable(
                    of: MoviesResponseWrapper.self
                ) { response in
                    switch response.result {
                    case .success(let value):
                        completion(
                            .success(
                                value.data ?? []
                            )
                        )
                    case .failure:
                        completion(
                            .failure(
                                URLErrorEnum.errorInvalidResponse
                            )
                        )
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func getAvailableNowMovies() -> AnyPublisher<[MovieResponse], Error> {
        let parameters: Parameters = [
            "api_key": apiKey
        ]
        
        return Future<[MovieResponse], Error> { completion in
            if let requestURL = URL(
                string: self.baseURL+MoviesRemoteRequestEnum.getAvailableNowMovies.rawValue
            ) {
                AF.request(
                    requestURL,
                    method: .get,
                    parameters: parameters
                ).validate()
                .responseDecodable(
                    of: MoviesResponseWrapper.self
                ) { response in
                    switch response.result {
                    case .success(let value):
                        completion(
                            .success(
                                value.data ?? []
                            )
                        )
                    case .failure:
                        completion(
                            .failure(
                                URLErrorEnum.errorInvalidResponse
                            )
                        )
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func getRandomMovie() -> AnyPublisher<[MovieResponse], Error> {
        let randomPage = Int.random(in: 1..<300)
        let parameters: Parameters = [
            "api_key": apiKey,
            "page": randomPage
        ]
        
        return Future<[MovieResponse], Error> { completion in
            if let requestURL = URL(
                string: self.baseURL+MoviesRemoteRequestEnum.getTrendingMovies.rawValue
            ) {
                AF.request(
                    requestURL,
                    method: .get,
                    parameters: parameters
                ).validate()
                .responseDecodable(
                    of: MoviesResponseWrapper.self
                ) { response in
                    switch response.result {
                    case .success(let value):
                        completion(
                            .success(
                                value.data ?? []
                            )
                        )
                    case .failure:
                        completion(
                            .failure(
                                URLErrorEnum.errorInvalidResponse
                            )
                        )
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func getMovieDetail(id: Int) -> AnyPublisher<[MovieResponse], Error> {
        let parameters: Parameters = [
            "api_key": apiKey
        ]
        
        return Future<[MovieResponse], Error> { completion in
            if let requestURL = URL(
                string: self.baseURL+MoviesRemoteRequestEnum.getMovieDetail.rawValue+"\(id)"
            ) {
                AF.request(
                    requestURL,
                    method: .get,
                    parameters: parameters
                ).validate()
                .responseDecodable(
                    of: MovieResponse.self
                ) { response in
                    switch response.result {
                    case .success(let value):
                        completion(
                            .success(
                                [value]
                            )
                        )
                    case .failure:
                        completion(
                            .failure(
                                URLErrorEnum.errorInvalidResponse
                            )
                        )
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}

internal enum MoviesRemoteRequestEnum: String {
    case getTrendingMovies = "movie/popular"
    case getAvailableNowMovies = "movie/now_playing"
    case getMovieDetail = "movie"
}
