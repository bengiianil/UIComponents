//
//  FontManager.swift
//  AppPermissions
//
//  Created by Bengi on 28.09.2021.
//

import UIKit

enum FontManager: GenericValueProtocol {
    
    // What is the type of Value? Define it, because GenericValueProtocol does not know
    typealias Value = UIFont
    
    // Conform the value, now value is unkonown. Converted value to UIFont
    var value: UIFont{
        
        // self give us type. Type is FontManager and the type of FontManager is enum. Then enum have cases
        switch self{
        case .bold(let size):
            return UIFont.systemFont(ofSize: size, weight: .bold)
        case .regular(let size):
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
    
    case bold(CGFloat)
    case regular(CGFloat)
}
