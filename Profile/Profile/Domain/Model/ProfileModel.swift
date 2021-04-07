//
//  ProfileModel.swift
//  Profile
//
//  Created by IT Division on 05/04/21.
//

import Foundation

public struct ProfileModel: Equatable {
    public var userName: String
    public var userEmail: String
    public var userPhotoURL: String
    public var userFavoriteMovieCategory: [String]
}
