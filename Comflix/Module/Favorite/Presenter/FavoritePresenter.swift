//
//  FavoritePresenter.swift
//  Comflix
//
//  Created by IT Division on 30/03/21.
//

import Foundation
import Combine
import SwiftUI

class FavoritePresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let router = HomeRouter()
    private let useCase: MoviesUseCase
    
    @Published var favoriteMovies: [MovieModel]?
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(useCase: MoviesUseCase) {
        self.useCase = useCase
    }
    
    func getFavoriteMovies() {
        loadingState = true
        self.useCase.getFavoriteMovies()
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure:
                self.errorMessage = String(describing: completion)
                self.loadingState = false
            case .finished:
                self.loadingState = false
            }
        }, receiveValue: { data in
            self.favoriteMovies = data
        }).store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        with movie: MovieModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(
                with: movie,
                isRandom: false
            )
        ) {
            content()
        }
    }
}
