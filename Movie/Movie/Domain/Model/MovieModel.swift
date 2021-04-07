//
//  MovieModel.swift
//  Movie
//
//  Created by IT Division on 07/04/21.
//

import Foundation

public struct MovieModel: Equatable, Identifiable {
    public let id: Int
    public let movieTitle: String
    public let moviePosterURL: String
    public let movieBackdropURL: String
    public let movieRating: Double
    public let movieReleaseDate: String
    public let movieDescription: String
    public let isFavorite: Int
    
    public init(
        id: Int,
        movieTitle: String,
        moviePosterURL: String,
        movieBackdropURL: String,
        movieRating: Double,
        movieReleaseDate: String,
        movieDescription: String,
        isFavorite: Int
    ) {
        self.id = id
        self.movieTitle = movieTitle
        self.moviePosterURL = moviePosterURL
        self.movieBackdropURL = movieBackdropURL
        self.movieRating = movieRating
        self.movieReleaseDate = movieReleaseDate
        self.movieDescription = movieDescription
        self.isFavorite = isFavorite
    }
    
    public func convertedReleaseDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self.movieReleaseDate) else { return "" }
        formatter.dateFormat = "dd MMMM yyyy"
        let convertedDateString = formatter.string(from: date)
        return convertedDateString
    }
}
