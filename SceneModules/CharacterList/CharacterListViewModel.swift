//
//  CharacterListViewModel.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import Foundation

class CharacterListViewModel {
    
}

extension CharacterListViewModel: ItemListProtocol {
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return 100
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        return nil
    }
}
