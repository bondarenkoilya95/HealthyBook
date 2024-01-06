//
//  BaseViewController.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 06.01.2024.
//

import Foundation
import UIKit

protocol BaseViewControllerDelegate: AnyObject {
    func viewDidLoad(on viewController: BaseViewController)
}

extension BaseViewControllerDelegate {
    func viewDidLoad(on viewController: BaseViewController) {
        /// Empty implementation
    }
}

class BaseViewController: UIViewController {
    
    private(set) weak var delegate: BaseViewControllerDelegate?
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(delegate: BaseViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate?.viewDidLoad(on: self)
    }
}
