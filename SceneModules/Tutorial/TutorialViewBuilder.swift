//
//  TutorialViewBuilder.swift
//  UIComponents
//
//  Created by Bengi on 8.10.2021.
//

import UIKit

class TutorialViewBuilder {
    
    class func build() -> UIViewController {
        
        let viewModel = TutorialViewModel(tutorials: [
            GenericContainerData(containerTitle: "Page1", containerPageIndex: 0, image: PageViewImages.page1.value),
            GenericContainerData(containerTitle: "Page2", containerPageIndex: 1, image: PageViewImages.page2.value),
            GenericContainerData(containerTitle: "Page3", containerPageIndex: 2, image: PageViewImages.page3.value),]
                                          ,applicationInfoManager: ApplicationGeneralInfoManager.shared)
            
        let viewController = TutorialViewController(viewModel: viewModel)
        
        return viewController
    }
}
