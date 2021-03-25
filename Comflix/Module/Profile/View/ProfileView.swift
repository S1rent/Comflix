//
//  ProfileView.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    
    @ObservedObject var presenter: ProfilePresenter
    
    var body: some View {
        if presenter.loadingState {
          VStack {
            Text("Loading...")
            ActivityIndicator()
          }
        } else {
            ScrollView {
                profileImage
                profileName
                profileEmail
                separatorView
                labelFavoriteGenre
                profileFavoriteGenre
            }.padding(
                [.leading, .trailing],
                16
            ).onAppear {
                if self.presenter.profileModel == nil {
                    self.presenter.getProfileData()
                }
            }
        }
    }
}

extension ProfileView {
    // Header Section
    var profileImage: some View {
        WebImage(
            url: URL(string: self.presenter.profileModel?.userPhotoURL ?? "")
        ).resizable()
        .indicator(.activity)
        .transition(.fade(duration: 0.5))
        .scaledToFill()
        .frame(
            width: 250,
            height: 250,
            alignment: .center
        ).clipShape(
            Circle()
        )
    }
    
    var profileName: some View {
        Text(
            self.presenter.profileModel?.userName ?? "-"
        ).font(
            .title
        )
        .bold()
        .lineLimit(3)
    }
    
    var profileEmail: some View {
        Text(
            self.presenter.profileModel?.userEmail ?? "-"
        ).font(
            .body
        ).lineLimit(3)
    }
    
    // Favorite Genre Section
    var labelFavoriteGenre: some View {
        Text(
            "Favorite Movie Genre"
        ).bold()
        .font(.title)
        .lineLimit(3)
    }
    
    var profileFavoriteGenre: some View {
        ForEach(
            self.presenter.profileModel?.userFavoriteMovieCategory ?? []
        ) { category in
      ZStack {
          FavoriteGenreItem(genre:  category)
          }
      }.padding(8)
    }
    
    // Other View
    var separatorView: some View {
        ZStack {
            Color.black.ignoresSafeArea()
        }.frame(width: UIScreen.main.bounds.width - 32, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
