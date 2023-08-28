//
//  CategoryDataSource.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 28/08/23.
//

import Foundation

class CategoryDataSource {
    
    private init() {}
        public static let shared = CategoryDataSource()
        
        public private(set) var categories: [CategoryItem] = [
            CategoryItem(title: "All Categories"),
            CategoryItem(title: "Business"),
            CategoryItem(title: "Entertainment"),
            CategoryItem(title: "General"),
            CategoryItem(title: "Health"),
            CategoryItem(title: "Science"),
            CategoryItem(title: "Sports"),
            CategoryItem(title: "Technology")
        ]
}

