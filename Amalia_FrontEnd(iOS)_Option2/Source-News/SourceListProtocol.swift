//
//  SourceListProtocol.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import UIKit
import Combine

protocol SourceListViewToPresenterProtocol: AnyObject {
    var view: SourceListPresenterToViewProtocol? { get set }
    var interactor: SourceListPresenterToInteractorProtocol? { get set }
    var router: SourceListPresenterToRouterProtocol? { get set }
    var sourceList: CurrentValueSubject<SourceListEntity?, NSError>! { get set }
    
    func startFetchSourceList(category: String)
    func showArticleList(indexPathRow: Int, navigationController: UINavigationController)
}

protocol SourceListPresenterToViewProtocol: AnyObject {
    func observeSourceList(subject: CurrentValueSubject<SourceListEntity?, NSError>)
}

protocol SourceListPresenterToRouterProtocol: AnyObject {
    static func createModule(category: String) -> SourceListView
    func pushToArticleList(using navigationController: UINavigationController, sourceId: String)
}

protocol SourceListPresenterToInteractorProtocol: AnyObject {
    var webservice: Webservice { get }
    var presenter: SourceListInteractorToPresenterProtocol? { get set }
    
    func fetchSourceList(category: String)
}

protocol SourceListInteractorToPresenterProtocol: AnyObject {
    func noticeSourceListFetched(_ sourceList: SourceListEntity)
    func noticeError()
}
