//
//  String+Extension.swift
//  Profile
//
//  Created by IT Division on 07/04/21.
//

import Foundation

extension String {
    var localized: String {
        let bundle = Bundle(identifier: "com.comflix.Common") ?? .main
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
}
