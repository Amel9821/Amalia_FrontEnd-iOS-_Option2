//
//  PresenterList.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import Combine
import UIKit

final class SourceListPresenter: SourceListViewToPresenterProtocol {
    weak var view: SourceListPresenterToViewProtocol?
    var interactor: SourceListPresenterToInteractorProtocol?
    var router: SourceListPresenterToRouterProtocol?
    var sourceList: CurrentValueSubject<SourceListEntity?, NSError>! = CurrentValueSubject(nil)
    
    init(view: SourceListPresenterToViewProtocol?,
         interactor: SourceListPresenterToInteractorProtocol?,
         router: SourceListPresenterToRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.view?.observeSourceList(subject: sourceList)
    }
    
    func startFetchSourceList(category: String) {
        interactor?.fetchSourceList(category: category)
    }

    func showArticleList(indexPathRow: Int, navigationController: UINavigationController) {
        if let results = sourceList.value?.sources, let sourceID = results[indexPathRow].id {
            router?.pushToArticleList(using: navigationController, sourceId: sourceID)
        }
    }
    
    
}

extension SourceListPresenter: SourceListInteractorToPresenterProtocol {
    func noticeSourceListFetched(_ sourceList: SourceListEntity) {
        self.sourceList.send(sourceList)
    }
    
    func noticeError() {
        self.sourceList.send(completion: .failure(NSError(domain: "Failed fetching datas", code: 400)))
    }
    
}



