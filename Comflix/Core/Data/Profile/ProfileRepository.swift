//
//  ProfileRepository.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation

class ProfileRepository: ProfileRepositoryProtocol {
    
    private let dataSource: ProfileDataSourceProtocol
    
    init(dataSource: ProfileDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getProfileData() -> ProfileEntity {
        return self.dataSource.getProfileData()
    }
}
