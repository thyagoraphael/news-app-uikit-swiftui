//
//  NewsHome.swift
//  NewsAppSwiftUI
//
//  Created by thyagoraphael on 7/19/21.
//

import SwiftUI

struct NewsHome: View {
    
    @ObservedObject private var newsListViewModel = NewsListViewModel()
    
    init() {
        newsListViewModel.load()
    }
    
    var body: some View {
        VStack {
            NewsListHeader()
            NewsListView(
                newsCollection: self.newsListViewModel.news,
                imageData: self.newsListViewModel.imageData
            )
        }
    }
}

struct NewsHome_Previews: PreviewProvider {
    static var previews: some View {
        NewsHome()
    }
}
