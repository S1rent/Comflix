//
//  FavoriteRouter.swift
//  Favorite
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import SwiftUI
import Movie
import Detail

class FavoriteRouter {
    func makeDetailView(with movie: MovieModel) -> some View {
        let useCase = MoviesInjection.init().provideMovies()
        let presenter = DetailPresenter(
            useCase: useCase,
            isRandom: false,
            movieID: movie.id
        )
        return DetailView(presenter: presenter)
    }
}
