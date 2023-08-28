//
//  SourceListInteractor.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import Foundation
import UIKit

final class SourceListInteractor: SourceListPresenterToInteractorProtocol {
    @Dependency(\.webservice) var webservice: Webservice
    weak var presenter: SourceListInteractorToPresenterProtocol?
   
    func fetchSourceList(category: String) {
        print("start fetching")
        let urlString = "\(LinkWebsite)category=\(category)&page=\(globalPage)&pageSize=10&q=\(globalSearchSource)&apiKey=\(apiKey)"
        print("urlString: \(urlString)")
        Task {
            do {
                let response = try await webservice.request(endpoint: urlString, type: SourceListEntity.self)
                presenter?.noticeSourceListFetched(response)
                print(response)
            } catch {
                presenter?.noticeError()
            }
        }
    }
    
}
