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
                let repository = YoutubeRepositoryImpl(service: YoutubeServiceTestImpl.shared)
                repository.searchContent(query: "kpop") { result in
                    print(result)
                }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
