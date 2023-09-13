//
//  LoadingView.swift
//  Mindie
//
//  Created by Benjamin Sage on 3/9/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        LottieView(name: "loading")
            .frame(width: 56, height: 56)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
