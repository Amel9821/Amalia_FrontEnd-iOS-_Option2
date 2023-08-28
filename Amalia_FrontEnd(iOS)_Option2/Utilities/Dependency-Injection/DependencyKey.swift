//
//  DependencyKey.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import Foundation

public protocol DependencyKey {
    associatedtype Value

    static var currentValue: Self.Value { get set }
}
