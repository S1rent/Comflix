//
//  GetListPresenter.swift
//  Core
//
//  Created by IT Division on 05/04/21.
//

import Foundation
import SwiftUI
import Combine

public class GetListPresenter<
    Request,
    Response,
    Interactor: UseCaseType,
    DestRouter: Router
>: ObservableObject
where
    Interactor.Request == Request,
    Interactor.Response == [Response],
    DestRouter.Request == Any {

    private var cancellables: Set<AnyCancellable> = []

    private let _useCase: Interactor
    private let router: DestRouter
    @Published public var list: [Response] = []
    
    @Published public var upcoming: [Response] = []
    @Published public var topRated: [Response] = []
    @Published public var popular: [Response] = []
    @Published public var nowPlaying: [Response] = []
    
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false

    public init(useCase: Interactor, router: DestRouter) {
        self._useCase = useCase
        self.router = router
    }

    public func getList(request: Request?) {
        isLoading = true
        _useCase.execute(request: request)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { list in
                self.list = list
            })
            .store(in: &cancellables)
    }

    public func viewBuilder<Content: View>(data: Response, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(
            destination: self.router.navigate(with: data)){ return content() }
    }
}
