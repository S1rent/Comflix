//
//  ContentView.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProfileView()
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
