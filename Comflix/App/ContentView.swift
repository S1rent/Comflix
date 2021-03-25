//
//  ContentView.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var profilePresenter: ProfilePresenter
    
    var body: some View {
        TabView {
            ProfileView(presenter: profilePresenter)
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
