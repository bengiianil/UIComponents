//
//  ApplicationGeneralInfoManager.swift
//  UIComponents
//
//  Created by Bengi on 13.10.2021.
//

import Foundation

class ApplicationGeneralInfoManager: ApplicationGeneralInfoProtocol {
    
    public static let shared = ApplicationGeneralInfoManager()
    
    private init() { }
    
    func isTutorialSeen() -> Bool {
        return TutorialViewInfoStore.hasTutorialSeen ?? false
    }
    
    func setTutorialViewSeenForThisDevice() {
        TutorialViewInfoStore.hasTutorialSeen = true
    }
}
