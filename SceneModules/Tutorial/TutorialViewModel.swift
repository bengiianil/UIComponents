//
//  TutorialViewModel.swift
//  UIComponents
//
//  Created by Bengi on 8.10.2021.
//

import Foundation

class TutorialViewModel {
    
    private let tutorials: [GenericContainerData]
    private let applicationInfoManager: ApplicationGeneralInfoProtocol

    init(tutorials: [GenericContainerData], applicationInfoManager: ApplicationGeneralInfoProtocol) {
        self.tutorials = tutorials
        self.applicationInfoManager = applicationInfoManager
    }
    
    func getItem(at index: Int) -> GenericContainerData {
        return tutorials[index]
    }
    
    func getItemCount() -> Int{
        return tutorials.count
    }
    
    func killTutorialView() {
        applicationInfoManager.setTutorialViewSeenForThisDevice()
    }
}
