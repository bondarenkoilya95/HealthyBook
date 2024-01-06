//
//  GetStartedScenario.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 07.01.2024.
//

import Foundation
import UIKit
import MDSArchitecture

class GetStartedScenario: InitialScenario {
    
    private(set) var getStartedViewController: GetStartedViewController?
    
    // MARK: - Override Methods
    
    override func start() {
        super.start()
        
        getStartedViewController = GetStartedViewController(delegate: self)
        let navigationController = UINavigationController(rootViewController: getStartedViewController!)
        installRootViewController(viewController: navigationController)
    }
}

extension GetStartedScenario: GetStartedViewControllerDelegate {
    
    func didPressHaveAccountButton(on viewController: GetStartedViewController) {
        
    }
    
    func didPressDoNotHaveAccountButton(on viewController: GetStartedViewController) {
        start(scenario: CreateAccountScenario(delegate: self, rootVC: viewController))
    }
}
