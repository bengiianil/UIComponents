//
//  CharacterListViewController.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import UIKit

class CharacterListViewController: BaseViewController<CharacterListViewModel> {

    private var itemListView: ItemListView!
    
    override func prepareViewControllerConfiguraitons() {
        super.prepareViewControllerConfiguraitons()
        addItemListView()
    }
    
    func addItemListView() {
        
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
}

