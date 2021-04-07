//
//  GetProfileDataSource.swift
//  Profile
//
//  Created by IT Division on 05/04/21.
//

import Foundation
import Core
import Combine
import RealmSwift

public struct GetProfileDataSource: LocaleDataSource {
    public typealias Request = Any
    public typealias Response = ProfileEntity
    
    public init() { }
    
    public func list(request: Any?) -> AnyPublisher<[ProfileEntity], Error> {
        
        return Future<[ProfileEntity], Error> { completion in
            completion(
                .success( [
                        ProfileEntity(
                            userName: "Philip Indra Prayitno",
                            userEmail: "philip.prayitno@gmail.com",
                            userPhotoURL: "https://media-exp1.licdn.com/dms/image/C5603AQG9lYqh9GJejQ/profile-displayphoto-shrink_400_400/0/1615005975720?e=1622073600&v=beta&t=53_PY8JMLAOUs0l6yaBJC2iOqPypV95K6bEHaxMxb6Y",
                            userFavoriteMovieCategory: [
                                "action".localized,
                                "adventure".localized,
                                "anime".localized,
                                "cartoon".localized,
                                "comedy".localized,
                                "fantasy".localized,
                                "scifi".localized
                            ]
                        )
                    ]
                )
            )
        }.eraseToAnyPublisher()
    }
    
    public func add(entities: [ProfileEntity]) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
    
    public func get(id: String) -> AnyPublisher<ProfileEntity, Error> {
        fatalError()
    }
    
    public func update(id: String, entity: ProfileEntity) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
}
