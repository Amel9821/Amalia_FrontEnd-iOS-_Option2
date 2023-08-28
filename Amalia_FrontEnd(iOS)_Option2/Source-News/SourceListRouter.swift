//
//  SourceListRouter.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import UIKit

final class SourceListRouter: SourceListPresenterToRouterProtocol {
    static func createModule(category: String) -> SourceListView {
        let view = SourceListView()
        let interactor = SourceListInteractor()
        let router = SourceListRouter()
        let presenter = SourceListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToArticleList(using navigationController: UINavigationController, sourceId: String) {
        let vc = ArticleListRouter.createModule(sourceID: sourceId)
        globalSource = sourceId
        navigationController.pushViewController(vc, animated: true)
    }
}
