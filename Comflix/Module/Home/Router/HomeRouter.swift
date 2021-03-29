//
//  HomeRouter.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import SwiftUI

class HomeRouter {
    func makeDetailView(with movie: MovieModel, isRandom: Bool) -> some View {
        let useCase = MoviesInjection.init().provideMovies()
        let presenter = DetailPresenter(
            useCase: useCase,
            movie: movie,
            isRandom: isRandom
        )
        return DetailView(presenter: presenter)
    }
}
