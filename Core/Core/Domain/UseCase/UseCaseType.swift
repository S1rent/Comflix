//
//  UseCaseType.swift
//  Core
//
//  Created by IT Division on 05/04/21.
//

import Foundation
import Combine

public protocol UseCaseType {
    associatedtype Request
    associatedtype Response

    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
