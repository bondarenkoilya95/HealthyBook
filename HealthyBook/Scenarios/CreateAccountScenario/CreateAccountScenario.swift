//
//  CreateAccountScenario.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 06.01.2024.
//

import Foundation
import MDSArchitecture

class CreateAccountScenario: Scenario {
    
    private(set) var createAccountViewController: CreateAccountViewController?
    
    // MARK: - Init Method
    
    // MARK: - Override Methods
    
    override func start() {
        super.start()
        
        createAccountViewController = CreateAccountViewController(delegate: self)
        rootVC?.navigationController?.pushViewController(createAccountViewController!, animated: true)
    }
}

extension CreateAccountScenario: CreateAccountViewControllerDelegate {
    
    
}
