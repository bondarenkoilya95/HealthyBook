//
//  AppDelegate.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 05.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainScenario: MainScenario?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initWindow()
        startMainScenario()
        
        return true
    }
    
    // MARK: - Private Methods
    
    private func initWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }
    
    private func startMainScenario() {
        guard let window = window else {
            assertionFailure("The window instance should be exist")
            return
        }
        
        mainScenario = MainScenario(window: window)
        mainScenario?.start()
    }
}

