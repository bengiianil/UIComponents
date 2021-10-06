//
//  SampleTest.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import UIKit

class SampleTest: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .red
    }
}
