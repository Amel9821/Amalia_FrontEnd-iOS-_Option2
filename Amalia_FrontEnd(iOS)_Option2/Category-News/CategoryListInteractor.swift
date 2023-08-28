//
//  CategoryListInteractor.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 28/08/23.
//

import Foundation

class CategoryListInteractor: CategoryInteractorInputProtocol {
    weak var presenter: CategoryInteractorOutputProtocol?
    
    var categoryStore = CategoryDataSource.shared
    var category: [CategoryItem] {
        return categoryStore.categories
    }
    
    func retrieveCategory() {
        presenter?.didRetrieveCategory(category)
    }
    
    
    
}
