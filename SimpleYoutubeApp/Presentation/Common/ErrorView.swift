//
//  ErrorView.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    let onRetry: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 4) {
            Text(error.localizedDescription)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Button("Retry") {
                self.onRetry?()
            }
            
        }.frame(maxWidth: 300)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: URLError(.badURL), onRetry: nil)
    }
}
