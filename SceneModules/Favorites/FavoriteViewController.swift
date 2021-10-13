//
//  FavoriteViewController.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

fileprivate extension Selector {
    static var getDataAction = #selector(FavoriteViewController.getDataAction)
}

class FavoriteViewController: BaseViewController<FavoriteViewModel> {

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: .getDataAction, for: .touchUpInside)
        button.setTitle("GET CHARACTER LIST", for: .normal)
        return button
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .yellow
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func getDataAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: .getDataByUsingExternalInteractions, object: nil)
    }
}
