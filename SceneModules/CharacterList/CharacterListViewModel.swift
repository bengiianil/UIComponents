//
//  CharacterListViewModel.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CharacterListViewModel {
    
    private var state: CharacterListViewStateBlock?
    
    init() {
        
    }
    
    func subscribeState(completion: @escaping CharacterListViewStateBlock) {
        state = completion
    }
    
    func getCharacterList() {
        state?(.loading)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) { [weak self] in
            
            self?.fireApiCall { [weak self] result in
                switch result {
                case .success(let response):
                    print("response: \(response)")
                case .failure(let error):
                    print("error: \(error)")
                }
                self?.state?(.done)
            }
        }
    }
    
    private func fireApiCall(with completion: @escaping (Result<CharacterDataResponse, ErrorResponse>) -> Void) {
        /**
         guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters?ts=8F46CC9B-4885-4D8D-9761-9092B84D4C5A&apikey=b1b6a2c675b36a5e44800a4fbaa2fb8e&hash=68cb7ec069de76b37db17dc7e2aa5b5c&offset=30&limit=30") else { return }
         
         var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
         request.httpMethod = "GET"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         
         APIManager.shared.executeRequest(urlRequest: , completion: completion)
         */

        do {
            let urlRequest = try MarvelCharactersApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
            
        }   catch let error {
            print("error: \(error)")
        }
    }
}

extension CharacterListViewModel: ItemListProtocol {
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return 0
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        return nil
    }
}
