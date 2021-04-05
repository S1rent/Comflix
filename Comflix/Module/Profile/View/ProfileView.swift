//
//  ProfileView.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Core
import Profile

struct ProfileView: View {
    
    @ObservedObject var presenter: GetSinglePresenter<
        Any,
    ProfileModel,
    Interactor<
        Any,
        ProfileModel,
        GetProfileRepository<
            GetProfileDataSource,
            ProfileTransformer>
    >>
    
    var body: some View {
        if presenter.isLoading {
          VStack {
            Text("Loading...")
            ActivityIndicator()
          }
        } else {
            ScrollView(
                .vertical,
                showsIndicators: false
            ) {
                profileImage
                profileName
                profileEmail
                SeparatorView()
                labelFavoriteGenre
                profileFavoriteGenre
            }.padding(
                [.leading, .trailing],
                16
            ).onAppear {
                if self.presenter.item == nil {
                    self.presenter.execute(request: "")
                }
            }
        }
    }
}

extension ProfileView {
    // Header Section
    var profileImage: some View {
        WebImage(
            url: URL(string: self.presenter.item?.userPhotoURL ?? "")
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
            self.presenter.item?.userName ?? "-"
        ).font(
            .title
        )
        .bold()
        .lineLimit(3)
    }
    
    var profileEmail: some View {
        Text(
            self.presenter.item?.userEmail ?? "-"
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
            self.presenter.item?.userFavoriteMovieCategory ?? []
        ) { category in
      ZStack {
          FavoriteGenreItem(genre:  category)
          }
      }.padding(8)
    }
}
