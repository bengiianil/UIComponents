//
//  FavoriteViewBuilder.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

class FavoriteViewBuilder{
    
    class func build() -> UIViewController {
        
        let manager = CharacterListOperationsRxManager.shared
        let viewModel = FavoriteViewModel(operationManager: manager)
        let viewController = FavoriteViewController(viewModel: viewModel)
        viewController.title = "Favorite"
        viewController.tabBarItem.image = TabBarImages.favorite.value
        viewController.tabBarItem.selectedImage = TabBarImages.favoriteSelected.value
        return viewController
    }
}

