//
//  DetailPresenter.swift
//  Comflix
//
//  Created by IT Division on 29/03/21.
//

import SwiftUI
import Combine

class DetailPresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let useCase: MoviesUseCase

    @Published var movie: MovieModel
    @Published var isRandom: Bool = false
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(
        useCase: MoviesUseCase,
        movie: MovieModel,
        isRandom: Bool
    ) {
        self.useCase = useCase
        self.movie = movie
        self.isRandom = isRandom
    }
    
    func getRandomMovie() {
        loadingState = true
        self.useCase.getRandomMovie()
        .receive(on: RunLoop.main)
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            },
            receiveValue: { data in
                self.movie = data.randomElement() ?? MovieModel(
                    id: -1,
                    movieTitle: "",
                    moviePosterURL: "",
                    movieBackdropURL: "",
                    movieRating: 0.0,
                    movieReleaseDate: "",
                    movieDescription: ""
                )
            }
        ).store(in: &cancellables)
    }
}
