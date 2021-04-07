//
//  HomePosterItem.swift
//  Comflix
//
//  Created by IT Division on 26/03/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Movie

struct HomePosterItem: View {
    var movie: MovieModel
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10.0
        ) {
            imageView
            titleView
        }
    }
}

extension HomePosterItem {
    var imageView: some View {
        WebImage(
            url: URL(
                string: "https://image.tmdb.org/t/p/w500/"+self.movie.moviePosterURL
            )
        )
        .resizable()
        .indicator(
            .activity
        )
        .transition(
            .fade(
                duration: 0.5
            )
        )
        .frame(
            width: 160,
            height: 240,
            alignment:.leading
        )
        .cornerRadius(8)
        .padding(.trailing, 16)
    }
    
    var titleView: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text(self.movie.movieTitle)
            .foregroundColor(
                .white
            ).padding(
                .all,
                4
            )
            .frame(
                width: 160,
                height: 30,
                alignment: .center
            )
        }.cornerRadius(6)
    }
}
