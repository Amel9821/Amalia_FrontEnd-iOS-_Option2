//
//  CategoryRouter.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 28/08/23.
//

import UIKit

class CategoryListRouter: CategoryRouterProtocol {
    static func createCategoryModule() -> UIViewController {
        let view = CategoryListView()
        let interactor: CategoryInteractorInputProtocol = CategoryListInteractor()
        let router = CategoryListRouter()
        let presenter: CategoryPresenterProtocol & CategoryInteractorOutputProtocol = CategoryListPresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func presentCategoryDetailScreen(from view: CategoryViewProtocol, for category: CategoryItem) {
        let sourceListVC = SourceListRouter.createModule(category: category.title)
        if category.title.lowercased() == "all categories" {
            globalCategory = ""
        } else {
            globalCategory = category.title
        }
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        
        viewVC.navigationController?.pushViewController(sourceListVC, animated: true)
    }
    
    
}
