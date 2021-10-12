//
//  CharacterListDataFormatter.swift
//  UIComponents
//
//  Created by Bengi on 10.10.2021.
//

import Foundation

class CharacterListDataFormatter: CharacterListDataFormatterProtocol {
    
    func getItem(from data: CharacterData) -> ItemTableViewCellData { // createImageData(by: data.thumbnail)
        return ItemTableViewCellData(imageData: CustomImageViewComponentData(imageUrl: "https://picsum.photos/200/300"), cellInfo: LabelPackComponentData(title: data.name, subtitle: getDescription(from: data.description)))
    }
    
    private func getDescription(from rawValue: String?) -> String {
        guard let value = rawValue, !value.isEmpty else {
            return "Unknown"
        }
        return value

    }
    
    private func createImageData(by value: Thumbnail) -> String {
        return "\(value.path)/portrait_incredible.\(value.thumbnailExtension)"
    }
    
}
