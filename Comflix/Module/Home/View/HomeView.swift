//
//  HomeView.swift
//  Comflix
//
//  Created by IT Division on 26/03/21.
//

import SwiftUI
import Movie
import Home

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        NavigationView {
            ZStack {
                if self.presenter.loadingState {
                    loadingIndicator
                } else {
                    ScrollView(
                        .vertical,
                        showsIndicators: false
                    ) {
                        greetView
                        SeparatorView()
                        trendingMoviesView
                        SeparatorView()
                        nowPlayingMoviesView
                        SeparatorView()
                        randomMovieView
                    }.padding(
                        EdgeInsets(
                            top: 0,
                            leading: 16,
                            bottom: 16,
                            trailing: 16
                        )
                    ).onAppear {
                        if self.presenter.trendingMovies.isEmpty {
                            self.presenter.getTrendingMovies()
                        }
                        
                        if self.presenter.availableMovies.isEmpty {
                            self.presenter.getAvailableMovies()
                        }
                    }
                }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    // Greet View
    var greetView: some View {
        Group {
            Text(
                "Hi there, what are you watching today ?"
            ).font(.title)
            .bold()
            .lineLimit(4)
            .padding(
                EdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 0,
                    trailing: 0
                )
            ).frame(
                width: UIScreen.main.bounds.width - 32,
                alignment: .leading
            )
        }
    }
    
    // Trending Movies View
    var trendingMoviesView: some View {
        Group {
            VStack(alignment: .leading, spacing: 8) {
                trendingMoviesTitle
                trendingMoviesList
            }
        }.padding(
            EdgeInsets(
                top: 8,
                leading: 16,
                bottom: 8,
                trailing: 0
            )
        )
    }
    
    var trendingMoviesTitle: some View {
        Text(
            "Trending"
        ).bold()
        .font(.title)
        .multilineTextAlignment(.leading)
    }
    
    var trendingMoviesList: some View {
        ScrollView(
            .horizontal,
            showsIndicators: false
        ) {
            HStack(
                alignment: .center,
                spacing: -8
            ) {
                ForEach(
                    self.presenter.trendingMovies
                ) { movie in
                    self.presenter.linkBuilder(
                        with: movie
                    ) {
                        HomePosterItem(
                            movie: movie
                        )
                    }
                }
            }
        }
    }
    
    // Now Playing Movies View
    var nowPlayingMoviesView: some View {
        Group {
            VStack(
                alignment: .leading,
                spacing: 8
            ) {
                nowPlayingMoviesTitle
                nowPlayingMoviesList
            }
        }.padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 8,
                trailing: 0
            )
        )
    }
    
    var nowPlayingMoviesTitle: some View {
        Text(
            "Available Now"
        ).bold()
        .font(.title)
        .multilineTextAlignment(.leading)
    }
    
    var nowPlayingMoviesList: some View {
        ScrollView(
            .horizontal,
            showsIndicators: false
        ) {
            HStack(
                alignment: .center,
                spacing: -8
            ) {
                ForEach(
                    self.presenter.availableMovies
                ) { movie in
                    self.presenter.linkBuilder(
                        with: movie
                    ) {
                        HomePosterItem(
                            movie: movie
                        )
                    }
                }
            }
        }
    }
    
    var randomMovieView: some View {
        Group {
            VStack(
                alignment: .center,
                spacing: 8
            ) {
                randomMovieTitle
                randomMovieCellView
            }
        }.padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 8,
                trailing: 16
            )
        )
    }
    
    var randomMovieTitle: some View {
        Text(
            "Don't know what to watch ? we'll pick for you"
        ).bold()
        .font(.title)
        .multilineTextAlignment(.leading)
        .frame(
            width: UIScreen.main.bounds.width - 32,
            alignment: .leading
        )
    }
    
    var randomMovieCellView: some View {
        self.presenter.linkBuilder(
            with: MovieModel(
                    id: -1,
                    movieTitle: "",
                    moviePosterURL: "",
                    movieBackdropURL: "",
                    movieRating: 0.0,
                    movieReleaseDate: "",
                    movieDescription: "",
                    isFavorite: 0
                ),
            content: {
                VStack {
                    Text("Random Movie")
                    .bold()
                    .font(.title)
                }
                .frame(
                    width: UIScreen.main.bounds.width-32,
                    height: 75,
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                )
                .border(Color.black, width: 1.5)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(
                        cornerRadius: 6
                    ).stroke(
                        Color.black,
                        lineWidth: 2
                    )
                )
            }, isRandom: true)
            .buttonStyle(PlainButtonStyle())
    }
    
    var loadingIndicator: some View {
        VStack {
            ActivityIndicator()
            Text("Loading...").bold()
        }
    }
}
