//
//  ItemListProtocol.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import Foundation

protocol ItemListProtocol: AnyObject {
    
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?
}
