//
//  ProfileRepositoryProtocol.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation
import Combine

protocol ProfileRepositoryProtocol {
    func getProfileData() -> AnyPublisher<ProfileModel, Error>
}
