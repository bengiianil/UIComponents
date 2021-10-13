//
//  TutorialViewInfoStore.swift
//  UIComponents
//
//  Created by Bengi on 13.10.2021.
//

import Foundation

struct TutorialViewInfoStore {
    
    @UserDefaultsWrapperHelper(key: "hasTutorialSeen", value: false)
    static var hasTutorialSeen: Bool?
}
