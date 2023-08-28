//
//  WebService.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import Foundation

struct WebserviceDependencyKey: DependencyKey {
    static var currentValue: Webservice = Webservice()
}

final class Webservice {
    func request<T: Decodable>(endpoint: String, type: T.Type) async throws -> T {
        guard let url = URL(string: endpoint) else { throw NSError(domain: "URL is invalid", code: 400) }
        let task = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(type.self, from: task.0)
        return decodedData
    }
}
