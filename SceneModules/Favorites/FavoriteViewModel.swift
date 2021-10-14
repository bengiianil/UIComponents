//
//  FavoriteViewModel.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import Foundation
import RxSwift
import Combine

class FavoriteViewModel {
        
    private let operationManager: CharacterListOperationsRxProtocol
    private let operationManagerCombine: CharacterListOperationsCombineProtocol

    init(operationManager: CharacterListOperationsRxProtocol, operationManagerCombine: CharacterListOperationsCombineProtocol) {
        self.operationManager = operationManager
        self.operationManagerCombine = operationManagerCombine
    }
    
    /**
     func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> Disposable {
         return operationManager.subscribeDataFlow(with: completion)
     }
     */

    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> AnyCancellable {
        return operationManagerCombine.subscribeDataFlow(with: completion)
    }

    
    func getCharacterListDataExternally() {
        // operationManager.getCharacterListData()
        operationManagerCombine.getCharacterListData()
    }
}
