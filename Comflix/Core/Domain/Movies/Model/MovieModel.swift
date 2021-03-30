//
//  MovieModel.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation

public struct MovieModel: Equatable, Identifiable {
    public let id: Int
    let movieTitle: String
    let moviePosterURL: String
    let movieBackdropURL: String
    let movieRating: Double
    let movieReleaseDate: String
    let movieDescription: String
    var isFavorite: Int
    
    func convertedReleaseDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self.movieReleaseDate) else { return "" }
        formatter.dateFormat = "dd MMMM yyyy"
        let convertedDateString = formatter.string(from: date)
        return convertedDateString
    }
}
