//
//  GenericContainerData.swift
//  UIComponents
//
//  Created by Bengi on 9.10.2021.
//

import Foundation
import UIKit

class GenericContainerData: PageViewDataProtocol {
    
    var title: String {
        return containerTitle
    }
    
    var pageIndex: Int {
        return containerPageIndex
    }
    
    private let containerTitle: String
    private let containerPageIndex: Int
    private let image: UIImage
    
    init(containerTitle: String, containerPageIndex: Int, image: UIImage) {
        self.containerTitle = containerTitle
        self.containerPageIndex = containerPageIndex
        self.image = image
    }
    
    func getImage() -> UIImage {
         return image
     }
}
