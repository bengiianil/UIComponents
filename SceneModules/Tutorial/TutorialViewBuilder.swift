//
//  TutorialViewBuilder.swift
//  UIComponents
//
//  Created by Bengi on 8.10.2021.
//

import UIKit

class TutorialViewBuilder {
    
    class func build() -> UIViewController {
        
        let viewModel = TutorialViewModel()
        let viewController = TutorialViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        return navigationViewController
    }
}
