//
//  DetailView.swift
//  Detail
//
//  Created by IT Division on 07/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

public struct DetailView: View {
    @ObservedObject var presenter: DetailPresenter
    @State var showPopup = false
    
    public init(presenter: DetailPresenter) {
        self.presenter = presenter
    }
    
    public var body: some View {
        if self.presenter.loadingState {
            loadingIndicator
        } else {
            ScrollView {
                VStack(
                    alignment: .leading,
                    spacing: 8,
                    content: {
                        movieImageView
                        movieTitleView
                        movieRatingView
                        separatorView
                        movieDescriptionView
                        separatorView
                        movieReleaseDateView
                        separatorView
                        if self.presenter.movie?.isFavorite == 0 {
                            noFavoriteView.padding(
                                .all,
                                16
                            ).onTapGesture {
                                self.presenter.updateFavoriteMovie()
                                self.showPopup = true
                            }
                        } else {
                            favoriteView.padding(
                                .all,
                                16
                            ).onTapGesture {
                                self.presenter.updateFavoriteMovie()
                                self.showPopup = true
                            }
                        }
                    }
                )
            }.onAppear(perform: {
                if self.presenter.movie == nil {
                    if self.presenter.isRandom { self.presenter.getRandomMovie()
                    } else {
                        self.presenter.getMovieDetail()
                    }
                }
            }).onDisappear(perform: {
                self.presenter.movie = nil
            }).alert(
                isPresented: $showPopup,
                content: {
                Alert(
                    title: Text("information".localized(identifier: "com.comflix.Common")),
                    message: Text(
                        "\(self.presenter.movie?.isFavorite == 1 ? "success_add_to_favorite".localized(identifier: "com.comflix.Common") : "success_remove_from_favorite".localized(identifier: "com.comflix.Common"))"
                    ),
                    dismissButton: Alert.Button.default(Text("OK")
                    ))
            }).navigationBarTitle(
                "movie_detail".localized(identifier: "com.comflix.Common"),
                displayMode: .inline
            )
        }
    }
}

extension DetailView {
    var movieImageView: some View {
        WebImage(
            url: URL(
                string: "https://image.tmdb.org/t/p/w500/"+(self.presenter.movie?.movieBackdropURL ?? "")
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
            height: 250,
            alignment: .center
        ).scaledToFill()
    }
    
    var movieTitleView: some View {
        Text(self.presenter.movie?.movieTitle ?? "")
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
            Text("\(String(format: "%.2f", self.presenter.movie?.movieRating ?? 0))")
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
        Text(self.presenter.movie?.movieTitle ?? "")
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
                Text("overview".localized(identifier: "com.comflix.Common"))
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
                Text(self.presenter.movie?.movieDescription ?? "")
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
                Text("release_date".localized(identifier: "com.comflix.Common"))
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
                    Text("\(self.presenter.movie?.convertedReleaseDate() ?? "")")
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
    
    var favoriteView: some View {
        HStack {
            Text("remove_from_favorite".localized(identifier: "com.comflix.Common"))
                .foregroundColor(.red)
                .padding(10)
        }.frame(width: UIScreen.main.bounds.width - 32)
        .border(Color.red, width: 1.5)
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(
                cornerRadius: 6
            ).stroke(
                Color.red,
                lineWidth: 2
            )
        )
    }
    
    var noFavoriteView: some View {
        HStack {
            Text("add_to_favorite".localized(identifier: "com.comflix.Common"))
                .foregroundColor(.blue)
                .padding(10)
        }.frame(width: UIScreen.main.bounds.width - 32)
        .border(Color.blue, width: 1.5)
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(
                cornerRadius: 6
            ).stroke(
                Color.blue,
                lineWidth: 2
            )
        )
    }
    
    var loadingIndicator: some View {
        VStack {
            ActivityIndicator()
            Text("Loading...").bold()
        }
    }
    
    var separatorView: some View {
        ZStack {
            Color.black.ignoresSafeArea()
        }.frame(width: UIScreen.main.bounds.width, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
