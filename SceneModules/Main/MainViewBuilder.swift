//
//  MainViewBuilder.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        viewController.title = "Main"
        viewController.tabBarItem.image = TabBarImages.home.value
        return viewController
    }
}
