//
//  NewsListViewModel.swift
//  NewsAppSwiftUI
//
//  Created by thyagoraphael on 7/19/21.
//

import Foundation

class NewsListViewModel: ObservableObject {
    @Published var news = [NewsViewModel]()
    @Published var imageData = [String: Data]()
    
    func load() {
        getNews()
    }
    
    private func getNews() {
        let networkManager = NetworkManager()
        networkManager.getNews { (newsArticles) in
            guard let news = newsArticles else { return }
            
            let newsViewModel = news.map(NewsViewModel.init)
            self.getImages(for: newsViewModel)
            DispatchQueue.main.async {
                self.news = newsViewModel
            }
        }
    }
    
    private func getImages(for news: [NewsViewModel]) {
        let nm = NetworkManager()
        news.forEach { n in
            guard !n.urlToImage.isEmpty else { return }
            
            nm.getImage(urlString: n.urlToImage) { (data) in
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    self.imageData[n.urlToImage] = data
                }
            }
        }
    }
}
