//
//  MainScenario.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 05.01.2024.
//

import Foundation
import MDSArchitecture

class MainScenario: InitialScenario {
    
    private(set) var splashViewController: SplashViewController?
    
    // MARK: - Override Methods
    
    override func start() {
        super.start()
        
        showLoadingSplashScreen()
        
        checkUserState()
    }
    
    // MARK: - Private Methods
    
    private func showLoadingSplashScreen() {
        splashViewController = SplashViewController()
        installRootViewController(viewController: splashViewController!)
    }
    
    private func checkUserState() {
        start(scenario: GetStartedScenario(window: window, delegate: self))
    }
}
