//
//  SceneDelegate.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let profileUseCase = ProfileInjection.init().provideUseCase()

        let profilePresenter = ProfilePresenter(useCase: profileUseCase)
        
        let homeUseCase = MoviesInjection.init().provideMovies()
        let homePresenter = HomePresenter(useCase: homeUseCase)
        
        let contentView = ContentView().environmentObject(profilePresenter)
            .environmentObject(homePresenter)

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
