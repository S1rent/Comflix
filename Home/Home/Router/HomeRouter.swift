//
//  HomeRouter.swift
//  Home
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import Movie
import SwiftUI
import Detail

public class HomeRouter {
    func makeDetailView(with movie: MovieModel, isRandom: Bool) -> some View {
        let useCase = MoviesInjection.init().provideMovies()
        let presenter = DetailPresenter(
            useCase: useCase,
            isRandom: isRandom,
            movieID: movie.id
        )
        return DetailView(presenter: presenter)
    }
}
