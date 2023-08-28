//
//  ArticleListInteractor.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import Foundation

final class ArticleListInteractor: ArticleListPresenterToInteractorProtocol {
    @Dependency(\.webservice) var webservice: Webservice
    weak var presenter: ArticleListInteractorToPresenterProtocol?
    
    func fetchArticleList(sourceID: String) {
        print("start fetching")
        let urlString = "\(LinkWebsiteArticles)sources=\(sourceID)&page=\(globalPage)&pageSize=10&q=\(globalSearchArticles)&apiKey=\(apiKey)"
        print("urlString: \(urlString)")
        Task {
            do {
                let response = try await webservice.request(endpoint: urlString, type: ArticleListEntity.self)
                presenter?.noticeArticleListFetched(response)
                print(response)
            } catch {
                presenter?.noticeError()
            }
        }
    }
    
}
