//
//  FavoriteRouter.swift
//  Comflix
//
//  Created by IT Division on 30/03/21.
//

import Foundation
import SwiftUI

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
