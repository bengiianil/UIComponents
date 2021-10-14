//
//  FavoriteViewController.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit
import RxSwift

fileprivate extension Selector {
    static var getDataAction = #selector(FavoriteViewController.getDataAction)
}

class FavoriteViewController: BaseViewController<FavoriteViewModel> {

    private let disposeBag = DisposeBag()
    
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
        
        subscribeViewModelPublishers()
    }
    
    @objc func getDataAction(_ sender: UIButton) {
        // NotificationCenter.default.post(name: .getDataByUsingExternalInteractions, object: nil)
        viewModel.getCharacterListDataExternally()
    }
    
    private func subscribeViewModelPublishers() {
        viewModel.subscribeDataFlow { [weak self] retrieved in
            print("Data has already retrieved!: \(retrieved)")
            DispatchQueue.main.async {
                self?.dataFlowHandler(with: retrieved)
            }
        }.disposed(by: disposeBag)
    }
    
    private func dataFlowHandler(with value: Bool) {
        
        UIView.transition(with: button, duration: 0.5, options: .transitionCrossDissolve) {
            if value {
                self.button.setTitle("Data has already gathered.", for: .normal)
            } else {
                self.button.setTitle("Data has not gathered yet.", for: .normal)
            }
        }
    }
}
