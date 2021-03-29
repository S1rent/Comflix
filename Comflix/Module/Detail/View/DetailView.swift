//
//  DetailView.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    var presenter: DetailPresenter
    
    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: 8,
                content: {
                    movieImageView
                    movieTitleView
                    movieRatingView
                    SeparatorView()
                    movieDescriptionView
                    SeparatorView()
                    movieReleaseDateView
                }
            )
        }.navigationBarTitle(
            "Movie Detail",
            displayMode: .inline
        )
    }
}

extension DetailView {
    var movieImageView: some View {
        WebImage(
            url: URL(
                string: "https://image.tmdb.org/t/p/w500/"+self.presenter.movie.movieBackdropURL
            )
        ).resizable()
        .indicator(
            .activity
        )
        .transition(
            .fade(
                duration: 0.5
            )
        ).frame(
            width: UIScreen.main.bounds.width,
            height: 175,
            alignment: .center
        ).scaledToFill()
    }
    
    var movieTitleView: some View {
        Text(self.presenter.movie.movieTitle)
            .font(.title)
            .bold()
            .padding(
                EdgeInsets(
                    top: 16,
                    leading: 16,
                    bottom: 4,
                    trailing: 16
                )
            )
            .lineLimit(7)
    }
    
    var movieRatingView: some View {
        HStack {
            Image(
                systemName: "star.fill"
            ).foregroundColor(.yellow)
            .frame(
                width: 16,
                height: 16,
                alignment: .leading
            )
            Text("\(String(format: "%.2f", self.presenter.movie.movieRating))")
            .font(.title)
            .bold()
            .padding(.leading, 8)
        }.padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 16,
                trailing: 16
            )
        )
    }
    
    var movieLabelView: some View {
        Text(self.presenter.movie.movieTitle)
            .font(.title)
            .bold()
            .padding(
                EdgeInsets(
                    top: 16,
                    leading: 16,
                    bottom: 16,
                    trailing: 16
                )
            )
            .lineLimit(7)
    }
    
    var movieDescriptionView: some View {
        VStack(
            alignment: .leading,
            spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/,
            content: {
                Text("Overview")
                    .font(.title)
                    .bold()
                    .padding(
                        EdgeInsets(
                            top: 8,
                            leading: 16,
                            bottom: 0,
                            trailing: 16
                        )
                    )
                    .lineLimit(7)
                Text(self.presenter.movie.movieDescription)
                    .font(
                        .body
                    )
                    .bold()
                    .padding(
                        EdgeInsets(
                            top: 2,
                            leading: 16,
                            bottom: 16,
                            trailing: 16
                        )
                    )
                    .lineLimit(100)
            }
        )
    }
    
    var movieReleaseDateView: some View {
        VStack(
            alignment: .leading,
            spacing: 8,
            content: {
                Text("Release Date")
                    .font(.title)
                    .bold()
                    .padding(
                        EdgeInsets(
                            top: 8,
                            leading: 16,
                            bottom: 0,
                            trailing: 16
                        )
                    )
                    .lineLimit(7)
                HStack {
                    Image(
                        systemName: "calendar"
                    ).frame(
                        width: 16,
                        height: 16,
                        alignment: .leading
                    )
                    Text("\(self.presenter.movie.convertedReleaseDate())")
                    .font(.body)
                    .bold()
                    .padding(.leading, 8)
                }.padding(
                    EdgeInsets(
                        top: 0,
                        leading: 16,
                        bottom: 16,
                        trailing: 16
                    )
                )
            }
        ).padding(.leading, 8)
    }
}
