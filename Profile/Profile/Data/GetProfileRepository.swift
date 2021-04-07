//
//  GetProfileRepository.swift
//  Profile
//
//  Created by IT Division on 05/04/21.
//

import Foundation
import Core
import Combine

public struct GetProfileRepository<
                ProfileDataSource: LocaleDataSource,
                Transformer: Mapper
                >: Repository
where
    ProfileDataSource.Response == ProfileEntity,
    Transformer.Response == Any,
    Transformer.Entity == [ProfileEntity],
    Transformer.Domain == [ProfileModel] {
  
    public typealias Request = Any
    public typealias Response = ProfileModel
    
    private let _localeDataSource: ProfileDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: ProfileDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _mapper = mapper
    }
    
    // 4
    public func execute(request: Any?) -> AnyPublisher<ProfileModel, Error> {
        
        return self._localeDataSource
            .list(request: nil)
            .map {
                (_mapper.transformEntityToDomain(
                    entity: $0
                    ).first ?? ProfileModel(userName: "", userEmail: "", userPhotoURL: "", userFavoriteMovieCategory: []))
            }.eraseToAnyPublisher()
    }
}
