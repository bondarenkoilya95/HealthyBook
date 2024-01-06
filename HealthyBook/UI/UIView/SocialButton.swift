//
//  SocialButton.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 07.01.2024.
//

import Foundation
import UIKit

class SocialButton: StandardButton {
    
    override func setupButton() {
        super.setupButton()
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray2.cgColor
    }
}
