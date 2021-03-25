//
//  ProfileModel.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation

struct ProfileModel: Equatable {
    var userName: String
    var userEmail: String
    var userPhotoURL: String
    var userFavoriteMovieCategory: [String]
}
