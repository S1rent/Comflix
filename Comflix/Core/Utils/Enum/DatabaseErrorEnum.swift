//
//  DatabaseErrorEnum.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation

enum DatabaseErrorEnum: LocalizedError {
    case errorInvalidInstance
    case errorRequestFailed
    
    var errorDescription: String? {
        switch self {
        case .errorInvalidInstance:
            return "Failed to instantiate the database."
        case .errorRequestFailed:
            return "Failed to perform your request."
        }
    }
}
