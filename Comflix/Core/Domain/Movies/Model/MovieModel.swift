//
//  MovieModel.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import Foundation

public struct MovieModel: Equatable, Identifiable {
    public let id: Int
    let movieTitle: String
    let moviePosterURL: String
    let movieBackdropURL: String
}
