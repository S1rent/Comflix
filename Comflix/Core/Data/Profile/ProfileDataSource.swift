//
//  ProfileDataSource.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation

import RealmSwift
import Combine

class ProfileDataSource: ProfileDataSourceProtocol {
    
    private init() { }
    static let shared = ProfileDataSource()
    
    func getProfileData() -> AnyPublisher<ProfileEntity, Error> {
        return Future<ProfileEntity, Error> { completion in
            completion(.success(ProfileEntity(
                userName: "Philip Indra Prayitno",
                userEmail: "philip.prayitno@gmail.com",
                userPhotoURL: "https://media-exp1.licdn.com/dms/image/C5603AQG9lYqh9GJejQ/profile-displayphoto-shrink_400_400/0/1615005975720?e=1622073600&v=beta&t=53_PY8JMLAOUs0l6yaBJC2iOqPypV95K6bEHaxMxb6Y",
                userFavoriteMovieCategory: [
                    "Action",
                    "Adventure",
                    "Anime",
                    "Cartoon",
                    "Comedy",
                    "Fantasy",
                    "Sci-Fi"
                ]
            )))
        }.eraseToAnyPublisher()
    }
}
