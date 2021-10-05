//
//  GenericBaseView.swift
//  AppPermissions
//
//  Created by Bengi on 29.09.2021.
//

import Foundation
import UIKit

// This notation <T> means its generic and T refers type, protocols dont allow that
class GenericBaseView<T>: BaseView {
    
    private var data: T?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // In second init, we can assign, give the data here
    init(frame: CGRect = .zero, data: T? = nil) {
        
        self.data = data
        super.init(frame: frame)
        loadDataView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // At init time if we give a data, this function works.
    func loadDataView() {
        
    }
    
    // If we dont give a data, set the data with method injection
    func setData(by value: T?) {
        self.data = value
        loadDataView()
    }
    
    func returnData() -> T? {
        return data
    }
}
