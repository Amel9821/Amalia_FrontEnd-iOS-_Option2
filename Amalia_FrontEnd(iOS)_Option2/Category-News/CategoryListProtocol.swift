//
//  CategoryListProtocol.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 28/08/23.
//

import UIKit

protocol CategoryViewProtocol: AnyObject {
    
    var presenter: CategoryPresenterProtocol? { get set }
    
    func showCategory(_ category: [CategoryItem])
}

protocol CategoryPresenterProtocol: AnyObject {
    
    var view: CategoryViewProtocol? { get set }
    var interactor: CategoryInteractorInputProtocol? { get set }
    var router: CategoryRouterProtocol? { get set }
    
    func viewWillAppear()
    func showSourceList(_ Category: CategoryItem)
}

protocol CategoryInteractorInputProtocol: AnyObject {

    var presenter: CategoryInteractorOutputProtocol? { get set }

    func retrieveCategory()
}
//
protocol CategoryInteractorOutputProtocol: AnyObject {

    func didRetrieveCategory(_ category: [CategoryItem])
}

protocol CategoryRouterProtocol: AnyObject {
    
    static func createCategoryModule() -> UIViewController
    
    func presentCategoryDetailScreen(from view: CategoryViewProtocol, for category: CategoryItem)
}
