//
//  Router.swift
//  Core
//
//  Created by IT Division on 05/04/21.
//

import Foundation
import SwiftUI

public protocol Router {
    associatedtype Request
    associatedtype Destination: View
    
    func navigate(with request: Request?) -> Destination
}
