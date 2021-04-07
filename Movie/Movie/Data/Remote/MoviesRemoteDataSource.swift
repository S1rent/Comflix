//
//  GetMovieRemoteDataSource.swift
//  Movie
//
//  Created by IT Division on 07/04/21.
//

import Core
import Combine
import Alamofire
import Foundation

public class MoviesRemoteDataSource {
    let baseURL = "https://api.themoviedb.org/3/"
    let apiKey = "93286dcb4bb910326e5e6607672a8685"
    public static let shared: MoviesRemoteDataSource =  MoviesRemoteDataSource()
    
    private init() {}
}

extension MoviesRemoteDataSource: MoviesRemoteDataSourceProtocol {
    
    public func getTrendingMovies() -> AnyPublisher<[MovieResponse], Error> {
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
    
    public func getAvailableNowMovies() -> AnyPublisher<[MovieResponse], Error> {
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
    
    public func getRandomMovie() -> AnyPublisher<[MovieResponse], Error> {
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
    
    public func getMovieDetail(id: Int) -> AnyPublisher<[MovieResponse], Error> {
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
