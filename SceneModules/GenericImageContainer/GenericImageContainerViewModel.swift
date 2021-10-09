//
//  GenericImageContainerViewModel.swift
//  UIComponents
//
//  Created by Bengi on 9.10.2021.
//

import Foundation
import UIKit

class GenericImageContainerViewModel {
    
    private let data: GenericContainerData
    
    init(data: GenericContainerData) {
        self.data = data
    }
    
    func getImageComponent() -> UIImage {
        return data.getImage()
    }
    
    func getPageIndex() -> Int {
        return data.pageIndex
    }
}
