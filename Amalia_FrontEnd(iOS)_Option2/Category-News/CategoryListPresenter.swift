//
//  SourceListPresenter.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 28/08/23.
//

import UIKit

class CategoryListPresenter: CategoryPresenterProtocol {
    weak var view: CategoryViewProtocol?
    var interactor: CategoryInteractorInputProtocol?
    var router: CategoryRouterProtocol?
    
    func viewWillAppear() {
        interactor?.retrieveCategory()
    }
    
    func showSourceList(_ Category: CategoryItem) {
        guard let view = view else { return }
        router?.presentCategoryDetailScreen(from: view, for: Category)
    }
}

extension CategoryListPresenter: CategoryInteractorOutputProtocol {
    func didRetrieveCategory(_ category: [CategoryItem]) {
        view?.showCategory(category)
    }
}
