//
//  CharacterListOperationsProtocol.swift
//  UIComponents
//
//  Created by Bengi on 13.10.2021.
//

import Foundation
import RxSwift

protocol CharacterListOperationsProtocol {
    
    func getCharacterListData()
    
    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> Disposable
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> Disposable
}
