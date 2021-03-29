//
//  DetailPresenter.swift
//  Comflix
//
//  Created by IT Division on 29/03/21.
//

import SwiftUI

class DetailPresenter: ObservableObject {
    private let useCase: MoviesUseCase

    @Published var movie: MovieModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(useCase: MoviesUseCase, movie: MovieModel) {
        self.useCase = useCase
        self.movie = movie
    }
}
