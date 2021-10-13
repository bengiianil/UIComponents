//
//  CharacterListViewModel.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

extension Selector {
    static let fireDataFlow = #selector(CharacterListViewModel.fireDataFlow)
}

class CharacterListViewModel {
    
    deinit {
        print("DEINIT: CharacterListViewModel")
        NotificationCenter.default.removeObserver(self, name: .getDataByUsingExternalInteractions, object: nil)
    }
    
    private let formatter: CharacterListDataFormatterProtocol
    private var data: CharacterDataResponse?
    private var state: CharacterListViewStateBlock?
    
    init(formatter: CharacterListDataFormatterProtocol) {
        self.formatter = formatter
        addExternalUserInteractions()
    }
    
    func subscribeState(completion: @escaping CharacterListViewStateBlock) {
        state = completion
    }
    
    func getCharacterList() {
        
        state?(.loading)
        fireApiCall(with: apiCallHandler)
        
        /**
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
        */
    }
    
    private func fireApiCall(with completion: @escaping (Result<CharacterDataResponse, ErrorResponse>) -> Void) {
        /**
         guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters?ts=8F46CC9B-4885-4D8D-9761-9092B84D4C5A&apikey=b1b6a2c675b36a5e44800a4fbaa2fb8e&hash=68cb7ec069de76b37db17dc7e2aa5b5c&offset=0&limit=30") else { return }
         
         var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
         request.httpMethod = "GET"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         
         APIManager.shared.executeRequest(urlRequest: , completion: completion)
         */

        do {
            let urlRequest = try MarvelCharactersApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    private func dataHandler(with response: CharacterDataResponse) {
        data = response
        state?(.done)
        fireNotificationCenter() 
    }
    
    private func fireNotificationCenter() {
        NotificationCenter.default.post(name: .notificationName, object: nil)
    }
    
    private func addExternalUserInteractions() {
        NotificationCenter.default.addObserver(self, selector: .fireDataFlow, name: .getDataByUsingExternalInteractions, object: nil)
    }
    @objc func fireDataFlow(_ sender: Notification) {
        getCharacterList()
    }
    
    // MARK: - CallBack Listener
    private lazy var apiCallHandler: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        // to show how to handle error .....
        switch result {
        case .failure(let error):
            print("error : \(error)")
            self?.state?(.failure)
        case .success(let data):
            self?.dataHandler(with: data)
        }
    }
}

extension CharacterListViewModel: ItemListProtocol {
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        // return 0
        guard let dataUnwrapped = data else { return 0 }
        return dataUnwrapped.data.results.count
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        // return nil
        guard let dataUnwrapped = data else { return nil }
        return formatter.getItem(from: dataUnwrapped.data.results[index])
    }
}
