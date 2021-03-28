//
//  MovieEntity.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation
import RealmSwift

class MovieEntity: Object {
    @objc dynamic var movieID: Int = 0
    @objc dynamic var movieName: String = ""
    @objc dynamic var moviePosterURL: String = ""
    @objc dynamic var movieBackdropURL: String = ""
    @objc dynamic var displayType: String = ""

    override static func primaryKey() -> String? {
        return "movieID"
    }
}

enum MovieEntityDisplayTypeEnum: String {
    case trending = "trending"
    case availableNow = "available_now"
}
