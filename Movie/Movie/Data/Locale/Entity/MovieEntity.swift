//
//  MovieEntity.swift
//  Movie
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import RealmSwift

public class MovieEntity: Object {
    @objc dynamic var movieID: Int = 0
    @objc dynamic var movieName: String = ""
    @objc dynamic var moviePosterURL: String = ""
    @objc dynamic var movieBackdropURL: String = ""
    @objc dynamic var displayType: String = ""
    @objc dynamic var movieRating: Double = 0.0
    @objc dynamic var movieReleaseDate: String = ""
    @objc dynamic var movieDescription: String = ""
    @objc dynamic var isFavorite: Int = 0

    public override static func primaryKey() -> String? {
        return "movieID"
    }
}

public enum MovieEntityDisplayTypeEnum: String {
    case trending = "trending"
    case availableNow = "available_now"
    case randomMovie = "random_movie"
}
