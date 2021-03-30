//
//  ContentView.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var profilePresenter: ProfilePresenter
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var favoritePresenter: FavoritePresenter
    
    var body: some View {
        TabView {
            homeView
            favoriteView
            profileView
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    // Home Page
    var homeView: some View {
        HomeView(presenter: homePresenter)
        .tabItem {
            VStack {
                Image(
                    systemName: "house"
                )
                Text(
                    "Home"
                ).foregroundColor(.white)
            }
        }.tag(0)
    }
    
    var favoriteView: some View {
        FavoriteView(presenter: favoritePresenter)
        .tabItem({
            VStack {
                Image(
                    systemName: "star"
                )
                Text("Favorite")
            }
        }).tag(1)
    }
    
    // Profile Page
    var profileView: some View {
        ProfileView(presenter: profilePresenter)
        .tabItem {
            VStack {
                Image(
                    systemName: "person"
                )
                Text(
                    "Profile"
                ).foregroundColor(.white)
            }
        }.tag(2)
    }
}
