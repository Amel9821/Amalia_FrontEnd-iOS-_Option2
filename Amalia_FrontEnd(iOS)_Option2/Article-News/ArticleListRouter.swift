//
//  ArticleListRouter.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import Foundation
import UIKit

final class ArticleListRouter: ArticleListPresenterToRouterProtocol {

    static func createModule(sourceID: String) -> ArticleListView {
        let view = ArticleListView()
        let interactor = ArticleListInteractor()
        let router = ArticleListRouter()
        let presenter = ArticleListPresenter(
            sourceID: sourceID,
            view: view,
            interactor: interactor,
            router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToArticleDetail(using navigationController: UINavigationController, urlArticle: String) {
        globalURLArticles = urlArticle
        let vc = ArticleWebView()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func popToSourceList(using navigationController: UINavigationController) {
        globalSearchSource = ""
        globalSearchArticles = ""
        navigationController.popViewController(animated: true)
    }
    
   
    
}
