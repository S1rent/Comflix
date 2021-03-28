//
//  URLErrorEnum.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation

enum URLErrorEnum: LocalizedError {
    case errorInvalidResponse
    case errorAddressUnreachable
    
    var errorDescription: String? {
        switch self {
        case .errorInvalidResponse:
            return "The server responded with empty objects."
        case .errorAddressUnreachable:
            return "The address is unreachable."
        }
    }
}
