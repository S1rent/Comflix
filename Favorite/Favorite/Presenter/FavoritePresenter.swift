//
//  FavoritePresenter.swift
//  Favorite
//
//  Created by IT Division on 07/04/21.
//

import Foundation
import SwiftUI
import Movie

import Foundation
import Combine
import SwiftUI

public class FavoritePresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let router = FavoriteRouter()
    private let useCase: MoviesUseCase
    
    @Published public var favoriteMovies: [MovieModel]?
    @Published public var errorMessage: String = ""
    @Published public var loadingState: Bool = false
    
    public init(useCase: MoviesUseCase) {
        self.useCase = useCase
    }
    
    public func getFavoriteMovies() {
        self.loadingState = true
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
    
    public func linkBuilder<Content: View>(
        with movie: MovieModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(
                with: movie
            )
        ) {
            content()
        }
    }
}
