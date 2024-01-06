//
//  GetStartedViewController.swift
//  HealthyBook
//
//  Created by Ilya Bondarenko on 06.01.2024.
//

import UIKit

protocol GetStartedViewControllerDelegate: BaseViewControllerDelegate {
    
    func didPressHaveAccountButton(on viewController: GetStartedViewController)
    
    func didPressDoNotHaveAccountButton(on viewController: GetStartedViewController)
}

class GetStartedViewController: BaseViewController {

    var _delegate: GetStartedViewControllerDelegate? {
        return delegate as? GetStartedViewControllerDelegate
    }
    
    let gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var haveAccountButton: UIButton!
    @IBOutlet weak var doNotHaveAccountButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var logoCenterY: NSLayoutConstraint!
    
    private var wasAnimation = false
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !wasAnimation {
            startAnimation()
            wasAnimation = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = bgImageView.bounds
    }
    
    // MARK: - Actions
    
    @IBAction func doNotHaveAccountButtonAction(_ sender: Any) {
        _delegate?.didPressDoNotHaveAccountButton(on: self)
    }
    
    @IBAction func haveAccountButtonAction(_ sender: Any) {
        _delegate?.didPressHaveAccountButton(on: self)
    }
}

private extension GetStartedViewController {
    
    func setupUI() {
        titleLabel.text = "Do you have an account?"
        haveAccountButton.setTitle("I have an account", for: .normal)
        doNotHaveAccountButton.setTitle("I don't have an account", for: .normal)
        
        setupGradient()
    }
    
    func setupGradient() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.5).cgColor, UIColor.black.withAlphaComponent(0.75).cgColor, UIColor.black.withAlphaComponent(0.5).cgColor, UIColor.clear.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.frame = bgImageView.bounds
        bgImageView.layer.addSublayer(gradientLayer)
    }
    
    func startAnimation() {
        startGradientAnimation()
        startLogoAnimation()
        startBottomContainerAnimation()
    }
    
    func startGradientAnimation() {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradientLayer.colors
        animation.toValue = [
            UIColor.black.withAlphaComponent(0.6).cgColor,
            UIColor.black.withAlphaComponent(0.75).cgColor,
            UIColor.black.cgColor
        ]
        animation.duration = 0.6
        
        // Update the model value immediately
        gradientLayer.colors = animation.toValue as? [CGColor]
        
        // Add the animation to the gradient layer
        gradientLayer.add(animation, forKey: "animateColors")
    }
    
    func startLogoAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.logoImageView.layer.opacity = 0.0
        } completion: { _ in
            self.logoCenterY.constant = -150
            
            UIView.animate(withDuration: 0.3) {
                self.logoImageView.layer.opacity = 1.0
            }
        }
    }
    
    func startBottomContainerAnimation() {
        bottomContainer.layer.opacity = 0.0
        bottomContainer.isHidden = false
        
        UIView.animate(withDuration: 0.6) {
            self.bottomContainer.layer.opacity = 1.0
        }
    }
}
