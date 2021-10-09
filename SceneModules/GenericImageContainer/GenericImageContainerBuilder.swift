//
//  GenericImageContainerBuilder.swift
//  UIComponents
//
//  Created by Bengi on 9.10.2021.
//

import Foundation
import UIKit

class GenericImageContainerBuilder {
    
    class func build(with data: GenericContainerData) -> UIViewController {
        
        let viewModel = GenericImageContainerViewModel(data: data)
        let viewController = GenericImageContainerViewController(viewModel: viewModel)
        return viewController
    }
}
