//
//  MainViewModel.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import Foundation

class MainViewModel {
    
    private var fireTutorialBlock: (() -> Void)?
    
    init() {
        fireTutorial()
    }
    
    func listenTutorialEvent(with completion: @escaping (() -> Void)) {
        fireTutorialBlock = completion
    }
    
    func fireTutorial() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.fireTutorialBlock?()
        }
    }
    
}
