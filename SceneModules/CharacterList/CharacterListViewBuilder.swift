//
//  CharacterListViewBuilder.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import UIKit

class CharacterListViewBuilder {
    
    class func build() -> UIViewController {
        
        let characterListFormatter = CharacterListDataFormatter()
        let manager = CharacterListOperationsRxManager.shared
        let viewModel = CharacterListViewModel(formatter: characterListFormatter, operationManager: manager)
        let viewController = CharacterListViewController(viewModel: viewModel)
        return viewController
    }
}
