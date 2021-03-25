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
        ScrollView {
           profileImage
           profileName
           profileEmail
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

extension ProfileView {
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
}
