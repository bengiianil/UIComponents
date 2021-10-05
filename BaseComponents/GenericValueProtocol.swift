//
//  GenericValueProtocol.swift
//  AppPermissions
//
//  Created by Bengi on 28.09.2021.
//

import Foundation

// GenericValueProtocol does not know the type it holds, which is Value
// We can decide the holded type while writing the code
protocol GenericValueProtocol {
    
    associatedtype Value
    var value: Value {
        get
    }
}
