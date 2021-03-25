//
//  ProfileView.swift
//  Comflix
//
//  Created by IT Division on 25/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    
    let profileURLs = URL(string: "")
    let profileEmails = "philip.prayitno@gmail.com"
    let profileNames = "Philip Indra Prayitno"
    
    var body: some View {
        ScrollView {
           profileImage
           profileName
           profileEmail
        }.padding(
            [.leading, .trailing],
            16
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var profileImage: some View {
        WebImage(
            url: profileURLs
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
            profileNames
        ).font(
            .title
        )
        .bold()
        .lineLimit(3)
    }
    
    var profileEmail: some View {
        Text(
            profileEmails
        ).font(
            .body
        ).lineLimit(3)
    }
}
