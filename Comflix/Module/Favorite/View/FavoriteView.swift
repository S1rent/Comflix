//
//  FavoriteView.swift
//  Comflix
//
//  Created by IT Division on 30/03/21.
//

import SwiftUI
import Combine

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter
    
    var body: some View {
        if self.presenter.loadingState {
            loadingIndicator
        } else {
            ScrollView {
                VStack {
                    ForEach(self.presenter.favoriteMovies) { movie in
                        self.presenter.linkBuilder(with: movie, content: {
                            FavoriteItemView(movie: movie)
                        })
                    }
                }
            }.onAppear {
                if self.presenter.favoriteMovies.isEmpty {
                    self.presenter.getFavoriteMovies()
                }
            }
        }
        
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
