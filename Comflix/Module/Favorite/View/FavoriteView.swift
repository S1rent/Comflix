//
//  FavoriteView.swift
//  Comflix
//
//  Created by IT Division on 30/03/21.
//

import SwiftUI
import Favorite

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter
    
    var body: some View {
        NavigationView {
            ZStack {
                if self.presenter.loadingState {
                    loadingIndicator
                } else if self.presenter.favoriteMovies != nil && !(self.presenter.favoriteMovies ?? []).isEmpty {
                    ScrollView {
                        VStack {
                            ForEach(self.presenter.favoriteMovies ?? []) { movie in
                                self.presenter.linkBuilder(with: movie, content: {
                                    FavoriteItemView(movie: movie)
                                })
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    .navigationTitle("Favorite")
                } else {
                    Text("No Data.")
                    .navigationTitle("Favorite")
                }
            }.onAppear {
                self.presenter.getFavoriteMovies()
            }
        }.navigationTitle("Favorite")
    }
}

extension FavoriteView {
    var loadingIndicator: some View {
        VStack {
            ActivityIndicator()
            Text("Loading...").bold()
        }
    }
}
