//
//  FirstPageViewController.swift
//  UIComponents
//
//  Created by Bengi on 8.10.2021.
//

import UIKit

fileprivate extension Selector {
    static var buttonTapped = #selector(FirstPageViewController.actionButtonTapped)
}

class FirstPageViewController: UIViewController {
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Page1: To ViewController2", for: .normal)
        button.titleLabel?.font = FontManager.bold(20).value
        button.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(pushButton)
        
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func actionButtonTapped(_ sender: UIButton) {
        let viewController = SecondPageViewController()
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
