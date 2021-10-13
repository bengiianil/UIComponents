//
//  UserDefaultsWrapperHelper.swift
//  UIComponents
//
//  Created by Bengi on 13.10.2021.
//

import Foundation

@propertyWrapper
struct UserDefaultsWrapperHelper<T> {
    
    let key: String
    let value: T?
    
    init(key: String, value: T?) {
        self.key = key
        self.value = value
    }
    
    var wrappedValue: T? {
        get {
            return UserDefaults.standard.object(forKey: key) as? T
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
