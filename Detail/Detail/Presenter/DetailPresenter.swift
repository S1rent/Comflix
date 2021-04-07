//
//  DetailPresenter.swift
//  Detail
//
//  Created by IT Division on 07/04/21.
//

import SwiftUI
import Combine
import Movie

public class DetailPresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let useCase: MoviesUseCase
    private var movieID: Int

    @Published public var movie: MovieModel?
    @Published public var isRandom: Bool = false
    @Published public var errorMessage: String = ""
    @Published public var loadingState: Bool = false
    @Published public var success: Bool = false

    public init(
        useCase: MoviesUseCase,
        isRandom: Bool,
        movieID: Int
    ) {
        self.useCase = useCase
        self.isRandom = isRandom
        self.movieID = movieID
    }
    
    public func getMovieDetail() {
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
    
    public func getRandomMovie() {
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
    
    public func updateFavoriteMovie() {
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
