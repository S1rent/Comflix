//
//  HomePresenter.swift
//  Home
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import SwiftUI
import Combine
import Movie

public class HomePresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let router = HomeRouter()
    private let useCase: MoviesUseCase

    @Published public var trendingMovies: [MovieModel] = []
    @Published public var availableMovies: [MovieModel] = []
    @Published public var errorMessage: String = ""
    @Published public var loadingState: Bool = false
  
    public init(
        useCase: MoviesUseCase
    ) {
        self.useCase = useCase
    }
  
    public func getTrendingMovies() {
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
    
    public func getAvailableMovies() {
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
    
    public func linkBuilder<Content: View>(
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
