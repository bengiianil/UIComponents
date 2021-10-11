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
    }
    
    private var itemListView: ItemListView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        // Adding major components
        addItemListView()
        
        // Listen view states
        subscribeViewModelListeners()
        
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
}

