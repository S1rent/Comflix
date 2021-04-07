//
//  String+Extension.swift
//  Detail
//
//  Created by IT Division on 07/04/21.
//

import Foundation

extension String {
    public func localized(identifier: String) -> String {
        let bundle = Bundle(identifier: identifier) ?? .main
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
}
