//
//  SceneDelegate.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import UIKit
import SwiftUI
import Core
import Profile
import Home
import Movie
import Favorite

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let profileInjection = ProfileInjection()
        
        let profileUseCase: Interactor<
            Any,
            ProfileModel,
            GetProfileRepository<
                GetProfileDataSource,
                ProfileTransformer>
        > = profileInjection.provideProfile()
        let profilePresenter = GetSinglePresenter(
            useCase: profileUseCase
        )
        
        let moviesUsecase = MoviesInjection.init().provideMovies()
        let homePresenter = HomePresenter(useCase: moviesUsecase)
        let favoritePresenter = FavoritePresenter(useCase: moviesUsecase)
        
        let contentView = ContentView()
            .environmentObject(profilePresenter)
            .environmentObject(homePresenter)
            .environmentObject(favoritePresenter)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
