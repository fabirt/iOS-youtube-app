//
//  LoadingView.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            CustomActivityIndicator()
                .frame(width: 40, height: 40)
                .foregroundColor(.accent)
            Text("Loading")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
