//
//  MoviesMapper.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation

final class MoviesMapper {
    static func mapMovieResponseToEntities(
        input response: [MovieResponse]
        ) -> [MovieEntity] {
        
        return response.map { result in
            let entity = MovieEntity()
            
            entity.movieID = result.movieID ?? 0
            entity.movieName = result.movieName ?? ""
            entity.moviePosterURL = result.moviePosterURL ?? ""
            entity.movieBackdropURL = result.movieBackdropURL ?? ""
            return entity
        }
    }
    
    static func mapMovieEntitiesToDomains(
        input entity: [MovieEntity]
        ) -> [MovieModel] {
        return entity.map { result in
            return MovieModel(
                id: result.movieID,
                movieTitle: result.movieName,
                moviePosterURL: result.moviePosterURL,
                movieBackdropURL: result.movieBackdropURL
            )
        }
    }

    static func mapMovieResponseToDomains(
        input response: [MovieResponse]
        ) -> [MovieModel] {

        return response.map { result in
            return MovieModel(
                id: result.movieID ?? 0,
                movieTitle: result.movieName ?? "",
                moviePosterURL: result.moviePosterURL ?? "",
                movieBackdropURL: result.movieBackdropURL ?? ""
            )
        }
    }
}