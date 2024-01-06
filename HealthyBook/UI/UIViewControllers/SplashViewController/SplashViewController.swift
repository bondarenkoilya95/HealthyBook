//
//  SplashViewController.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 06.01.2024.
//

import UIKit

class SplashViewController: BaseViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingIndicator.startAnimating()
    }

}
