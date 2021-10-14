//
//  CharacterListOperationsRxProtocol.swift
//  UIComponents
//
//  Created by Bengi on 14.10.2021.
//

import Foundation
import RxSwift

protocol CharacterListOperationsRxProtocol {
    
    func getCharacterListData()
    
    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> Disposable
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> Disposable
}
