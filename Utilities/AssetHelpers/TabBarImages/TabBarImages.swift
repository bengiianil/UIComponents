//
//  TabBarImages.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

enum TabBarImages: String, GenericValueProtocol {
    
    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case bug = "bug"
    case bugSelected = "bugSelected"
    case favorite = "favorite"
    case favoriteSelected = "favoriteSelected"
    case home = "home"
    case homeSelected = "homeSelected"
}
