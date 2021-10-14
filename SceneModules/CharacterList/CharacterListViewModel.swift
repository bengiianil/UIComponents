//
//  CharacterListViewModel.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift
import Combine

/**
 extension Selector {
     static let fireDataFlow = #selector(CharacterListViewModel.fireDataFlow)
 }
 */

class CharacterListViewModel {
    
    private var subscriptions = Set<AnyCancellable>()
    
    deinit {
        print("DEINIT: CharacterListViewModel")
        // NotificationCenter.default.removeObserver(self, name: .getDataByUsingExternalInteractions, object: nil)
    }
    
    private let disposeBag = DisposeBag()
    
    private let formatter: CharacterListDataFormatterProtocol
    private let operationManager: CharacterListOperationsRxProtocol
    private let operationManagerCombine: CharacterListOperationsCombineProtocol
    private var data: CharacterDataResponse?
    private var state: CharacterListViewStateBlock?
    
    init(formatter: CharacterListDataFormatterProtocol, operationManager: CharacterListOperationsRxProtocol, operationManagerCombine: CharacterListOperationsCombineProtocol) {
        self.formatter = formatter
        self.operationManager = operationManager
        self.operationManagerCombine = operationManagerCombine
        // addExternalUserInteractions()
        subscribeOperationManagerPublisher()
    }
    
    func subscribeState(completion: @escaping CharacterListViewStateBlock) {
        state = completion
    }
    
    func getCharacterList() {
        state?(.loading)
        // fireApiCall(with: apiCallHandler)
        // operationManager.getCharacterListData()
        operationManagerCombine.getCharacterListData()
    }
    
    private func dataHandler(with response: CharacterDataResponse) {
        data = response
        state?(.done)
        // fireNotificationCenter() 
    }
    
    private func subscribeOperationManagerPublisher() {
        
        operationManagerCombine.subscribeDataPublisher { [weak self] result in
            switch result {
            case .failure(let error):
                print("error : \(error)")
            case .success(let response):
                print("success")
                self?.dataHandler(with: response)
            }
        }.store(in: &subscriptions)
        
        /**
         operationManager.subscribeDataPublisher { [weak self] result in
             switch result {
             case .failure(let error):
                 print("error : \(error)")
             case .success(let response):
                 print("success")
                 self?.dataHandler(with: response)
             }
         }.disposed(by: disposeBag)
         */
    }
   
    /**
     private func fireNotificationCenter() {
         NotificationCenter.default.post(name: .notificationName, object: nil)
     }
     private func addExternalUserInteractions() {
         NotificationCenter.default.addObserver(self, selector: .fireDataFlow, name: .getDataByUsingExternalInteractions, object: nil)
     }
     @objc func fireDataFlow(_ sender: Notification) {
         getCharacterList()
     }
     */

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
