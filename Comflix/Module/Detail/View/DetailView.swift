//
//  DetailView.swift
//  Comflix
//
//  Created by IT Division on 28/03/21.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            Text("Hello, This Is Detail!")
        }.navigationBarTitle(
            "Movie Detail",
            displayMode: .inline
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
