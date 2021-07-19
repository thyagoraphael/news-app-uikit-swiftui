//
//  NewsListView.swift
//  NewsAppSwiftUI
//
//  Created by thyagoraphael on 7/19/21.
//

import SwiftUI

struct NewsListView: View {
    
    let newsCollection: [NewsViewModel]
    let imageData: [String: Data]
    
    var body: some View {
        List(self.newsCollection, id: \.url) {
            news in
            NewsCell(
                news: news,
                image: Image(uiImage: self.imageData[news.urlToImage] == nil ? UIImage(systemName: "doc.append")! : UIImage(data: self.imageData[news.urlToImage]!)!)
            )
        }
    }
}
