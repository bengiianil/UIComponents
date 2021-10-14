//
//  CharacterListOperationsCombineManagers.swift
//  UIComponents
//
//  Created by Bengi on 14.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import Combine

class CharacterListOperationsCombineManager: CharacterListOperationsCombineProtocol {

    public static let shared = CharacterListOperationsCombineManager()
    
    private let dataPublishSubject = PassthroughSubject<CharacterListResult, Never>()
    private let dataFlowSubject = PassthroughSubject<Bool, Never>()

    // MARK: - Public Methods
    func getCharacterListData() {
        fireApiCall(with: apiCallHandler)
    }
    
    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> AnyCancellable {
        return dataPublishSubject.sink(receiveValue: completion)
    }
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> AnyCancellable {
        return dataFlowSubject.sink(receiveValue: completion)
    }
    
    // MARK: - Private Methods
    private func fireApiCall(with completion: @escaping CharacterListResultBlock) {
        
        dataFlowSubject.send(false)
        
        do {
            let urlRequest = try MarvelCharactersApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    // MARK: - CallBack Listener
    private lazy var apiCallHandler: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        self?.dataPublishSubject.send(result)
        self?.dataFlowSubject.send(true)
    }
}
