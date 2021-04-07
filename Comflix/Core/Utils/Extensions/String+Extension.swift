//
//  String+Extension.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation

extension String: Identifiable {
    public var id: String {
        UUID().uuidString
    }
}

extension String {
    public func localized(identifier: String) -> String {
        let bundle = Bundle(identifier: identifier) ?? .main
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
}
