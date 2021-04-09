//
//  Error+Extension.swift
//  Core
//
//  Created by IT Division on 05/04/21.
//

import Foundation

public enum URLErrorEnum: LocalizedError {
    case errorInvalidResponse
    case errorAddressUnreachable
    
    public var errorDescription: String? {
        switch self {
        case .errorInvalidResponse:
            return "The server responded with empty objects."
        case .errorAddressUnreachable:
            return "The address is unreachable."
        }
    }
}

public enum DatabaseErrorEnum: LocalizedError {
    case errorInvalidInstance
    case errorRequestFailed
    
    public var errorDescription: String? {
        switch self {
        case .errorInvalidInstance:
            return "Failed to instantiate the database."
        case .errorRequestFailed:
            return "Failed to perform your request."
        }
    }
}
