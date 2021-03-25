//
//  ProfileRepository.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation
import Combine

final class ProfileRepository {

    typealias ProfileInstance = (ProfileDataSource) -> ProfileRepository
    
    fileprivate let dataSource: ProfileDataSourceProtocol
    
    private init(dataSource: ProfileDataSourceProtocol) {
        self.dataSource = dataSource
    }

    public static let shared: ProfileInstance = { repository in
        return ProfileRepository(dataSource: repository)
    }
}

extension ProfileRepository: ProfileRepositoryProtocol {
    func getProfileData() -> AnyPublisher<ProfileModel, Error> {
        return self.dataSource
                .getProfileData()
                .map {
                ProfileMapper.mapCategoryEntitiesToDomains(input: $0)
                }.eraseToAnyPublisher()
    }
}
