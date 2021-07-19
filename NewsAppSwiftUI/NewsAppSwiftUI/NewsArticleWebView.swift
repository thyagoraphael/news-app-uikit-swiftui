//
//  NewsArticleWebView.swift
//  NewsAppSwiftUI
//
//  Created by thyagoraphael on 7/19/21.
//

import SwiftUI

struct NewsArticleWebView: View {
    
    var newsUrl: String
    
    var body: some View {
        SwiftUIWebView(urlString: newsUrl)
            .padding(.top, 20)
    }
}
