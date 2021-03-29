//
//  HomeRouter.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import SwiftUI

class HomeRouter {
    func makeDetailView(with movie: MovieModel) -> some View {
        let useCase = MoviesInjection.init().provideMovies()
        let presenter = DetailPresenter(
            useCase: useCase,
            movie: movie
        )
        return DetailView(presenter: presenter)
    }
}
