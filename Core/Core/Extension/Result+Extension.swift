//
//  Result+Extension.swift
//  Core
//
//  Created by IT Division on 05/04/21.
//

import Foundation
import RealmSwift

extension Results {
    public func toArray<T: Object>(fromType: T.Type) -> [T] {
        var finalResult = [T]()
        for idx in 0 ..< count {
            if let obj = self[idx] as? T {
                finalResult.append(obj)
            }
        }
        return finalResult
    }
}
