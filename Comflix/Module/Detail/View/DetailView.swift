//
//  DetailView.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: 8,
                content: {
                    movieImageView
                    movieTitleView
                    movieRatingView
                    SeparatorView()
                    movieDescriptionView
                    SeparatorView()
                    movieReleaseDateView
                }
            )
        }.navigationBarTitle(
            "Movie Detail",
            displayMode: .inline
        )
    }
}

extension DetailView {
    var movieImageView: some View {
        WebImage(
            url: URL(
                string: "https://d17ivq9b7rppb3.cloudfront.net/original/academy/menjadi_ios_developer_expert_logo_230320222603.jpg"
            )
        ).resizable()
        .indicator(
            .activity
        )
        .transition(
            .fade(
                duration: 0.5
            )
        ).frame(
            width: UIScreen.main.bounds.width,
            height: 175,
            alignment: .center
        ).scaledToFill()
    }
    
    var movieTitleView: some View {
        Text("Movie Title")
            .font(.title)
            .bold()
            .padding(
                EdgeInsets(
                    top: 16,
                    leading: 16,
                    bottom: 4,
                    trailing: 16
                )
            )
            .lineLimit(7)
    }
    
    var movieRatingView: some View {
        HStack {
            Image(
                systemName: "star.fill"
            ).foregroundColor(.yellow)
            .frame(
                width: 16,
                height: 16,
                alignment: .leading
            )
            Text("7.4")
            .font(.title)
            .bold()
            .padding(.leading, 8)
        }.padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 16,
                trailing: 16
            )
        )
    }
    
    var movieLabelView: some View {
        Text("Movie Title")
            .font(.title)
            .bold()
            .padding(
                EdgeInsets(
                    top: 16,
                    leading: 16,
                    bottom: 16,
                    trailing: 16
                )
            )
            .lineLimit(7)
    }
    
    var movieDescriptionView: some View {
        VStack(
            alignment: .leading,
            spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/,
            content: {
                Text("Overview")
                    .font(.title)
                    .bold()
                    .padding(
                        EdgeInsets(
                            top: 8,
                            leading: 16,
                            bottom: 0,
                            trailing: 16
                        )
                    )
                    .lineLimit(7)
                Text("Movie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie DescriptionMovie Description")
                    .font(
                        .body
                    )
                    .bold()
                    .padding(
                        EdgeInsets(
                            top: 2,
                            leading: 16,
                            bottom: 16,
                            trailing: 16
                        )
                    )
                    .lineLimit(100)
            }
        )
    }
    
    var movieReleaseDateView: some View {
        VStack(
            alignment: .leading,
            spacing: 8,
            content: {
                Text("Release Date")
                    .font(.title)
                    .bold()
                    .padding(
                        EdgeInsets(
                            top: 8,
                            leading: 16,
                            bottom: 0,
                            trailing: 16
                        )
                    )
                    .lineLimit(7)
                HStack {
                    Image(
                        systemName: "calendar"
                    ).frame(
                        width: 16,
                        height: 16,
                        alignment: .leading
                    )
                    Text("28 Januari 2021")
                    .font(.body)
                    .bold()
                    .padding(.leading, 8)
                }.padding(
                    EdgeInsets(
                        top: 0,
                        leading: 16,
                        bottom: 16,
                        trailing: 16
                    )
                )
            }
        ).padding(.leading, 8)
    }
}
