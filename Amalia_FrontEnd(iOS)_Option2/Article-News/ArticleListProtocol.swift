//
//  ArticleListProtocol.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 28/08/23.
//

import UIKit
import Combine

protocol ArticleListViewToPresenterProtocol: AnyObject {
    var view: ArticleListPresenterToViewProtocol? { get set }
    var interactor: ArticleListPresenterToInteractorProtocol? { get set }
    var router: ArticleListPresenterToRouterProtocol? { get set }
    var articleList: CurrentValueSubject<ArticleListEntity?, NSError>! { get set }
    
    func startFetchArticleList(sourceID: String)
    func showArticleDetail(indexPathRow: Int, navigationController: UINavigationController)
    func backToMovieList(navigationController: UINavigationController)
}

protocol ArticleListPresenterToViewProtocol: AnyObject {
    func observeArticleList(subject: CurrentValueSubject<ArticleListEntity?, NSError>)
}

protocol ArticleListPresenterToRouterProtocol: AnyObject {
    static func createModule(sourceID: String) -> ArticleListView
    func pushToArticleDetail(using navigationController: UINavigationController, urlArticle: String)
    func popToSourceList(using navigationController: UINavigationController)
}

protocol ArticleListPresenterToInteractorProtocol: AnyObject {
    var webservice: Webservice { get }
    var presenter: ArticleListInteractorToPresenterProtocol? { get set }
    
    func fetchArticleList(sourceID: String)
}

protocol ArticleListInteractorToPresenterProtocol: AnyObject {
    func noticeArticleListFetched(_ articleList: ArticleListEntity)
    func noticeError()
}
