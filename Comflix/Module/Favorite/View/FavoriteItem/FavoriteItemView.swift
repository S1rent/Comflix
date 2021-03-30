//
//  FavoriteItemView.swift
//  Comflix
//
//  Created by IT Division on 30/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteItemView: View {
    var body: some View {
        VStack(
            alignment: .center,
            spacing: 0,
            content: {
                header
                content
            }
        ).border(Color.black, width: 1.5)
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(
                cornerRadius: 6
            ).stroke(
                Color.black,
                lineWidth: 2
            )
        ).padding(
            EdgeInsets(
                top: 8,
                leading: 16,
                bottom: 8,
                trailing: 16
            )
        )
    }
}

extension FavoriteItemView {
    var header: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Name")
            .foregroundColor(.white)
            .font(.body)
        }.frame(
            width: UIScreen.main.bounds.width - 32,
            height: 45,
            alignment: .center
        ).cornerRadius(6, corners: [.topLeft, .topRight])
    }
    
    var content: some View {
        VStack {
            Group {
                ZStack {
                    Color.black.ignoresSafeArea()
                    image.padding(5)
                }.frame(
                    width: UIScreen.main.bounds.width - 32,
                    height: 50,
                    alignment: .center
                )
                
                ZStack {
                    HStack(
                        alignment: .firstTextBaseline,
                        spacing: 8,
                        content: {
                            rating
                            Text("TES")
                        }
                    ).padding(
                        EdgeInsets(
                            top: 16,
                            leading: 16,
                            bottom: 16,
                            trailing: 100
                        )
                    ).frame(
                        width: UIScreen.main.bounds.width - 32,
                        height: .infinity,
                        alignment: .leading
                    )
                }
            }
        }
    }
    
    var image: some View {
        WebImage(url: URL(string: "https://i.stack.imgur.com/TW2Oy.png"))
            .resizable()
            .indicator(.activity)
            .transition(.fade)
            .frame(
                width: UIScreen.main.bounds.width - 32,
                height: 100,
                alignment: .center
            ).scaledToFill()
    }
    
    var rating: some View {
        Image(
            systemName: "star.fill"
        ).foregroundColor(.yellow)
        .frame(
            width: 16,
            height: 16,
            alignment: .leading
        )
    }
}
