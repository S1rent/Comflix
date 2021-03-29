//
//  HomePresenter.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let router = HomeRouter()
    private let useCase: MoviesUseCase

    @Published var trendingMovies: [MovieModel] = []
    @Published var availableMovies: [MovieModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
  
    init(
        useCase: MoviesUseCase
    ) {
        self.useCase = useCase
    }
  
    func getTrendingMovies() {
        loadingState = true
        useCase
        .getTrendingMovies()
        .receive(
            on: RunLoop.main
        )
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(
                    describing: completion
                )
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { movies in
                self.trendingMovies = movies
            }
        )
        .store(in: &cancellables)
    }
    
    func getAvailableMovies() {
        loadingState = true
        useCase
        .getAvailableMovies()
        .receive(
            on: RunLoop.main
        )
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(
                    describing: completion
                )
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { movies in
                self.availableMovies = movies
            }
        )
        .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        with movie: MovieModel,
        @ViewBuilder content: () -> Content,
        isRandom: Bool = false
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(
                with: movie,
                isRandom: isRandom
            )
        ) {
            content()
        }
    }
}
