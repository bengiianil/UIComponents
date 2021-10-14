//
//  CharacterListViewController.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import UIKit

class CharacterListViewController: BaseViewController<CharacterListViewModel> {

    deinit {
        print("DEINIT: CharacterListViewController")
        // After observing and listening operation, clear the memory with remove func
        // NotificationCenter.default.removeObserver(self, name: .notificationName, object: nil)
    }
    
    private var itemListView: ItemListView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        // Adding major components
        addItemListView()
        
        // Listen view states
        subscribeViewModelListeners()
        // addObserver()
        
        // To access the data
        viewModel.getCharacterList()
    }
    private func addItemListView() {
        
        itemListView = ItemListView()
        itemListView.translatesAutoresizingMaskIntoConstraints = false
        // itemListView.delegate = self
        itemListView.delegate = viewModel
        
        view.addSubview(itemListView)
        
        NSLayoutConstraint.activate([
        
            itemListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemListView.topAnchor.constraint(equalTo: view.topAnchor),
            itemListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func subscribeViewModelListeners() {
        
        viewModel.subscribeState { [weak self] state in
            switch state {
            case .done:
                print("Data is ready.")
                self?.itemListView.reloadTableView()
            case .loading:
                print("Data is getting.")
            case .failure:
                print("Error")
                // show alert popup
            }
        }
    }
    
    /**
     private func addObserver() {
         NotificationCenter.default.addObserver(self, selector: .notificationAction, name: .notificationName, object: nil)
     }
     
     @objc fileprivate func notificationAction(_ sender: Notification) {
         print("\(#function)") // it prints this function name
         itemListView.reloadTableView()
     }
     */
    @objc fileprivate func notificationAction(_ sender: Notification) {
        
    }
}

/**
 // MARK: - Notification Name Extensions
 extension Notification.Name {
     static let notificationName = Notification.Name("NotificationOperation")
     static let getDataByUsingExternalInteractions = Notification.Name("getDataByUsingExternalInteractions")

 }
 // MARK: - Selector Extensions
 extension Selector {
     static let notificationAction = #selector(CharacterListViewController.notificationAction)
 }
 */

