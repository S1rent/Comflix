//
//  ProfilePresenter.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import Foundation
import SwiftUI
import Combine

class ProfilePresenter: ProfilePresenterProtocol, ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let useCase: ProfileUseCase

    @Published var profileModel: ProfileModel?
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(useCase: ProfileUseCase) {
        self.useCase = useCase
    }
    
    func getProfileData() {
        loadingState = true
        self.useCase.getProfileData()
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
            receiveValue: {
                data in
            self.profileModel = data
            }
        ).store(in: &cancellables)
    }
}
