//
//  DependencyContainer.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import Foundation

public class DependencyContainer {
    private static var current = DependencyContainer()
    
    public static subscript<K>(key: K.Type) -> K.Value where K: DependencyKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    public static subscript<T>(_ keyPath: WritableKeyPath<DependencyContainer, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
    
    public static func setDependency<K>(initialValue: K.Value, key: K.Type) where K: DependencyKey {
        key.currentValue = initialValue
    }
}

extension DependencyContainer {
    var webservice: Webservice {
        get { Self.self[WebserviceDependencyKey.self] }
        set { Self.self[WebserviceDependencyKey.self] = newValue }
    }
}
