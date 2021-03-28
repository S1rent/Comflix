//
//  MoviesResponseWrapper.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation

public struct MoviesResponseWrapper: Decodable {
    let data: [MovieResponse]?
    
    internal enum CodingKeys: String, CodingKey {
        case data = "results"
    }
}

public struct MovieResponse: Decodable {
    let movieID: Int?
    let movieName: String?
    let moviePosterURL: String?
    let movieBackdropURL: String?
    
    internal enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case movieName = "title"
        case moviePosterURL = "poster_path"
        case movieBackdropURL = "backdrop_path"
    }
}