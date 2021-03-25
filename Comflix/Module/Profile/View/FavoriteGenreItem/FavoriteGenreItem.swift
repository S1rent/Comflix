//
//  FavoriteGenreItem.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import SwiftUI

struct FavoriteGenreItem: View {
    var genre: String
    
    var body: some View {
        HStack {
            Text(genre).foregroundColor(.black)
                .padding(10)
        }.frame(width: UIScreen.main.bounds.width - 32)
        .cornerRadius(6)
        .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .overlay(
            RoundedRectangle(
                cornerRadius: 6
            ).stroke(
                Color.black,
                lineWidth: 2
            )
        )
    }
}

struct FavoriteGenreItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteGenreItem(genre: "Romance")
    }
}
