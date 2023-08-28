//
//  ArticleListPresenter.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import UIKit
import Combine

final class ArticleListPresenter: ArticleListViewToPresenterProtocol {
    var sourceID: String
    
    weak var view: ArticleListPresenterToViewProtocol?
    var interactor: ArticleListPresenterToInteractorProtocol?
    var router: ArticleListPresenterToRouterProtocol?
    var articleList: CurrentValueSubject<ArticleListEntity?, NSError>! = CurrentValueSubject(nil)
    
    init(sourceID: String,
         view: ArticleListPresenterToViewProtocol?,
         interactor: ArticleListPresenterToInteractorProtocol?,
         router: ArticleListPresenterToRouterProtocol?) {
        self.sourceID = sourceID
        self.view = view
        self.interactor = interactor
        self.router = router
        view?.observeArticleList(subject: articleList)
    }
    
    func startFetchArticleList(sourceID: String) {
        interactor?.fetchArticleList(sourceID: sourceID)
    }
    
    
    func showArticleDetail(indexPathRow: Int, navigationController: UINavigationController) {
        if let results = articleList.value?.articles, let urlArticle = results[indexPathRow].url {
            router?.pushToArticleDetail(using: navigationController, urlArticle: urlArticle)
        }
    }
    
    func backToMovieList(navigationController: UINavigationController) {
        router?.popToSourceList(using: navigationController)
    }
    
    
}

extension ArticleListPresenter: ArticleListInteractorToPresenterProtocol {
    func noticeArticleListFetched(_ articleList: ArticleListEntity) {
        self.articleList.send(articleList)
    }
    
    func noticeError() {
        self.articleList.send(completion: .failure(NSError(domain: "Failed fetching datas", code: 400)))
    }
    
}
