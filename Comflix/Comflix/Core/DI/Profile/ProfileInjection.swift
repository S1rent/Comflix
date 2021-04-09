//
//  ProfileInjection.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation
import UIKit
import Profile
import Core

final class ProfileInjection: NSObject {
    
    func provideProfile<U: UseCaseType>() -> U where U.Request == Any, U.Response == ProfileModel {
        let dataSource = GetProfileDataSource()
        let mapper = ProfileTransformer()
        
        let repository = GetProfileRepository(
            localeDataSource: dataSource,
            mapper: mapper
        )
        
        
        return Interactor(repository) as! U
    }
}
