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
