//
//  ProfileDataSourceProtocol.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation
import RealmSwift
import Combine

protocol ProfileDataSourceProtocol {
    func getProfileData() -> AnyPublisher<ProfileEntity, Error>
}
