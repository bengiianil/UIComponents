//
//  GenericImageContainerViewController.swift
//  UIComponents
//
//  Created by Bengi on 9.10.2021.
//

import Foundation
import UIKit

class GenericImageContainerViewController: BaseViewController<GenericImageContainerViewModel> {
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addImageViewComponent()
        setImageViewComponentData()
    }
    
    func addImageViewComponent() {
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setImageViewComponentData() {
        imageView.image = viewModel.getImageComponent()
    }
}
