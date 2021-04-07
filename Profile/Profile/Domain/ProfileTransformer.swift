//
//  ProfileTransformer.swift
//  Profile
//
//  Created by IT Division on 05/04/21.
//

import Foundation
import Core

public struct ProfileTransformer: Mapper {
    public typealias Response = Any
    public typealias Request = Any
    public typealias Entity = [ProfileEntity]
    public typealias Domain = [ProfileModel]
    
    public init() {}
    
    public func transformResponseToEntity(request: Any?, response: Any) -> [ProfileEntity] {
        return [
            ProfileEntity(userName: "", userEmail: "", userPhotoURL: "", userFavoriteMovieCategory: [])
        ]
    }
    
    public func transformEntityToDomain(entity: [ProfileEntity]) -> [ProfileModel] {
        
        return [
            ProfileModel(
                userName: entity.first?.userName ?? "",
                userEmail: entity.first?.userEmail ?? "",
                userPhotoURL: entity.first?.userPhotoURL ?? "",
                userFavoriteMovieCategory: entity.first?.userFavoriteMovieCategory ?? []
            )
        ]
    }
}
