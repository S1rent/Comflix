//
//  FavoriteView.swift
//  Comflix
//
//  Created by IT Division on 30/03/21.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(1..<10) { _ in
                    FavoriteItemView()
                }
            }
        }
    }
}

extension FavoriteView {
    
}
