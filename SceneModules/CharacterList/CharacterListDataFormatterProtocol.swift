//
//  CharacterListDataFormatterProtocol.swift
//  UIComponents
//
//  Created by Bengi on 10.10.2021.
//

import Foundation

protocol CharacterListDataFormatterProtocol {
    
    func getItem(from data: CharacterData) -> ItemTableViewCellData
}
