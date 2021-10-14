//
//  CharacterListOperationsCombineProtocol.swift
//  UIComponents
//
//  Created by Bengi on 14.10.2021.
//

import Foundation
import Combine

protocol CharacterListOperationsCombineProtocol {
    
    func getCharacterListData()
    
    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> AnyCancellable
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> AnyCancellable
}
