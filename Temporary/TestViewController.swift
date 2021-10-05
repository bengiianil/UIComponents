//
//  TestViewController.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

fileprivate extension Selector {
    static var buttonTapped2 = #selector(TestViewController.buttonAction2)
}

class TestViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: .buttonTapped2, for: .touchUpInside)
        button.setTitle("PUSH", for: .normal)
        // button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonAction2(_ sender: UIButton) {
        print("Push Button Pressed.")
        let viewController = UIViewController()
        viewController.view.backgroundColor = .cyan
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
