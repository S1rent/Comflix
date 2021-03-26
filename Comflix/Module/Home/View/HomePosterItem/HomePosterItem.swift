//
//  HomePosterItem.swift
//  Comflix
//
//  Created by IT Division on 26/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomePosterItem: View {
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10.0
        ) {
            imageView
            titleView
        }
    }
}

struct HomePosterItem_Previews: PreviewProvider {
    static var previews: some View {
        HomePosterItem()
    }
}

extension HomePosterItem {
    var imageView: some View {
        WebImage(
            url: URL(
                string: "https://image.tmdb.org/t/p/w500/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg"
            )
        )
        .resizable()
        .indicator(
            .activity
        )
        .transition(.fade(duration: 0.5)
        )
        .frame(
            width: 160,
            height: 240,
            alignment:.leading
        )
        .cornerRadius(8)
        .padding(.trailing, 16)
    }
    
    var titleView: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Titlee")
            .foregroundColor(
                .white
            ).padding(
                .all,
                4
            )
            .frame(
                width: 160,
                height: 30,
                alignment: .center
            )
        }.cornerRadius(6)
    }
}
