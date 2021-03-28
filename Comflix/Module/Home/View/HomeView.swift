//
//  HomeView.swift
//  Comflix
//
//  Created by IT Division on 26/03/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        ScrollView(
            .vertical,
            showsIndicators: false
        ) {
            greetView
            SeparatorView()
            trendingMoviesView
            SeparatorView()
            nowPlayingMoviesView
        }.padding(
            EdgeInsets(
                top: 8,
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
                height: .infinity,
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
            VStack(alignment: .leading, spacing: 8) {
                nowPlayingMoviesTitle
                nowPlayingMoviesList
            }
        }.padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 0,
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
}
