//
//  CreateAccountViewController.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 07.01.2024.
//

import UIKit

protocol CreateAccountViewControllerDelegate: BaseViewControllerDelegate {
    
}

class CreateAccountViewController: BaseViewController {

    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Actions
    
    @objc func didPressBackButton() {
        
    }
}

private extension CreateAccountViewController {
    
    func setupUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(didPressBackButton))
    }
}
