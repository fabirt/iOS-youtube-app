//
//  SearchView.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var text = "Hello World!"
    
    var body: some View {
        Text(text)
            .onAppear {
                do {
                    try YoutubeServiceTestImpl.shared.searchContent(query: "kpop") { result in
                        print(result)
                    }
                } catch {
                    print(error)
                }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
