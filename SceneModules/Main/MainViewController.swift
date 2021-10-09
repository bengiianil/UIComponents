//
//  MainViewController.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

fileprivate extension Selector {
    static var buttonTapped = #selector(MainViewController.buttonAction)
}

class MainViewController: BaseViewController<MainViewModel> {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        button.setTitle("PUSH", for: .normal)
        // button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .green
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        
        fireCharacterListView()
        
        /** These tasks handled below with fireCharacterListView() func
        print("Push Button Pressed.")
        let viewController = TestViewController()
        viewController.title = "Navigation Bar"
        // self.navigationController?.pushViewController(viewController, animated: true)
        let newNavigationController = UINavigationController(rootViewController: viewController)
        newNavigationController.navigationBar.backgroundColor = .red
        self.present(newNavigationController, animated: true, completion: nil)
         */
    }
    
    private func fireCharacterListView() {
        let characterListView = CharacterListViewBuilder.build()
        self.navigationController?.pushViewController(characterListView, animated: true)
    }
}
