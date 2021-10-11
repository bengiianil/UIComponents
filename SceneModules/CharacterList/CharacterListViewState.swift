//
//  CharacterListViewState.swift
//  UIComponents
//
//  Created by Bengi on 8.10.2021.
//

import Foundation

typealias CharacterListViewStateBlock = (CharacterListViewState) -> Void

enum CharacterListViewState {
    
    case loading
    case done
    case failure
    
}
