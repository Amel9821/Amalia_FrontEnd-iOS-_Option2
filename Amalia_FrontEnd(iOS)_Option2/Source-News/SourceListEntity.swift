//
//  SourceNewsListEntity.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 24/08/23.
//

import Foundation

// MARK: - GetSources
struct SourceListEntity: Codable, Hashable {
    let status: String?
    let sources: [SourceResultEntity]?
}

// MARK: - SourceResult
struct SourceResultEntity: Codable, Hashable {
    let id, name, description: String?
    let url: String?
    let category, language, country: String?
}
