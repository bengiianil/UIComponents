//
//  CharacterListOperationsManager.swift
//  UIComponents
//
//  Created by Bengi on 13.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift

typealias CharacterListResult = Result<CharacterDataResponse, ErrorResponse>
typealias CharacterListResultBlock = (Result<CharacterDataResponse, ErrorResponse>) -> Void

class CharacterListOperationsManager: CharacterListOperationsProtocol {
    
    public static let shared = CharacterListOperationsManager()
    
    private let dataPublishSubject = PublishSubject<CharacterListResult>()
    private let dataFlowSubject = PublishSubject<Bool>()

    // MARK: - Public Methods
    func getCharacterListData() {
        fireApiCall(with: apiCallHandler)
    }
    
    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> Disposable {
        return dataPublishSubject.subscribe(onNext: completion)
    }
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> Disposable {
        return dataFlowSubject.subscribe(onNext: completion)
    }
    
    // MARK: - Private Methods
    private func fireApiCall(with completion: @escaping CharacterListResultBlock) {
        
        dataFlowSubject.onNext(false)
        
        do {
            let urlRequest = try MarvelCharactersApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
        
        /**
         guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters?ts=8F46CC9B-4885-4D8D-9761-9092B84D4C5A&apikey=b1b6a2c675b36a5e44800a4fbaa2fb8e&hash=68cb7ec069de76b37db17dc7e2aa5b5c&offset=0&limit=30") else { return }
         
         var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
         request.httpMethod = "GET"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         
         APIManager.shared.executeRequest(urlRequest: , completion: completion)
         */
    }
    
    // MARK: - CallBack Listener
    private lazy var apiCallHandler: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        self?.dataPublishSubject.onNext(result)
        self?.dataFlowSubject.onNext(true)
        /**
         // to show how to handle error .....
         switch result {
         case .failure(let error):
             print("error : \(error)")
         case .success(let data):
             print("success")
         }
         */
    }
}
