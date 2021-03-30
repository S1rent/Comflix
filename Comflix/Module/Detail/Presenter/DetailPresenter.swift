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
    private var movieID: Int

    @Published var movie: MovieModel?
    @Published var isRandom: Bool = false
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var success: Bool = false

    init(
        useCase: MoviesUseCase,
        isRandom: Bool,
        movieID: Int
    ) {
        self.useCase = useCase
        self.isRandom = isRandom
        self.movieID = movieID
    }
    
    func getMovieDetail() {
        loadingState = true
        self.useCase.getMovieDetail(id: movieID)
        .receive(on: RunLoop.main)
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                    self.loadingState = false
                case .finished:
                    self.loadingState = false
                }
            },
            receiveValue: { data in
                self.movie = data.first
            }
        ).store(in: &cancellables)
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
                    self.loadingState = false
                case .finished:
                    self.loadingState = false
                }
            },
            receiveValue: { data in
                self.movie = data.randomElement()
            }
        ).store(in: &cancellables)
    }
    
    func updateFavoriteMovie() {
        loadingState = true
        self.useCase.updateFavoriteMovie(with: self.movie?.id ?? 0)
        .receive(on: RunLoop.main)
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                    self.loadingState = false
                case .finished:
                    self.loadingState = false
                }
            },
            receiveValue: { success in
                self.loadingState = false
                self.success = success
            }
        ).store(in: &cancellables)
        self.useCase.getMovieDetail(id: self.movie?.id ?? 0)
        .receive(on: RunLoop.main)
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                    self.loadingState = false
                case .finished:
                    self.loadingState = false
                }
            },
            receiveValue: { data in
                self.movie = data.first
            }
        ).store(in: &cancellables)
    }
}
