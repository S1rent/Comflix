//
//  SeparatorView.swift
//  Comflix
//
//  Created by IT Division on 26/03/21.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
        }.frame(width: UIScreen.main.bounds.width, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
