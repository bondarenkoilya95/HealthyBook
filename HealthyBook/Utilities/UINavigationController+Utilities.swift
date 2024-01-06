//
//  UINavigationController+Utilities.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 07.01.2024.
//

import Foundation
import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
        view.tintColor = UIColor.tintColor
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
