//
//  MainViewModel.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import Foundation

class MainViewModel {
    
    private var fireTutorialBlock: (() -> Void)?
    
    private let applicationInfoManager: ApplicationGeneralInfoProtocol
    
    init(applicationInfoManager: ApplicationGeneralInfoProtocol) {
        self.applicationInfoManager = applicationInfoManager
        fireTutorial()
    }
    
    func listenTutorialEvent(with completion: @escaping (() -> Void)) {
        fireTutorialBlock = completion
    }
    
    func fireTutorial() {
        
        guard !applicationInfoManager.isTutorialSeen() else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.fireTutorialBlock?()
        }
        
        /**
         if !UserDefaults.standard.bool(forKey: "hasTutorialSeen") {
             DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                 self.fireTutorialBlock?()
             }
         }
         */
    }
}
