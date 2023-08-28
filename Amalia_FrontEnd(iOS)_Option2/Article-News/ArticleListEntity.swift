//
//  ArticleNewsListEntity.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import Foundation

// MARK: - GetArticles
struct ArticleListEntity: Codable, Hashable {
    let status: String?
    let totalResults: Int?
    let articles: [ArticleResultEntity]?
}

// MARK: - ArticleResult
struct ArticleResultEntity: Codable, Hashable {
    let source: ArticleSourceEntity?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - ArticleSource
struct ArticleSourceEntity: Codable, Hashable {
    let id: String?
    let name: String?
}
