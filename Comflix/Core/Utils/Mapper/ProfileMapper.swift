//
//  ProfileMapper.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation

final class ProfileMapper {
    static func mapCategoryEntitiesToDomains(
        input entity: ProfileEntity
        ) -> ProfileModel {
        return ProfileModel(
            userName: entity.userName,
            userEmail: entity.userEmail,
            userPhotoURL: entity.userPhotoURL,
            userFavoriteMovieCategory: entity.userFavoriteMovieCategory
        )
    }
}
