//
//  PermissionImages.swift
//  AppPermissions
//
//  Created by Bengi on 30.09.2021.
//

import Foundation
import UIKit

enum PermissionImages: String, GenericValueProtocol {
    
    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)

        /**
         //we dont need switch because both case return same thing
         switch self {
         case .camera:
             return UIImage(imageLiteralResourceName: rawValue) // rawValue refers "camera_"
         case .photos:
             return UIImage(imageLiteralResourceName: rawValue)
         }
         */
    }
    
    case camera = "camera_"
    case photos = "photos_"
}
