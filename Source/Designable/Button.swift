//
//  Button.swift
//  ADVHelper
//
//  Created by nattaponph58@nu.ac.th on 06/09/2020.
//  Copyright (c) 2020 nattaponph58@nu.ac.th. All rights reserved.
//

import UIKit

@IBDesignable
open class Button: UIButton {
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        gradient?.frame = self.layer.bounds
        
        setupUnderline()
        
        self.imageView?.alpha = imageAlpha
        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    //MARK: - Border
    
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            if let gradientLayer = gradient {
                gradientLayer.cornerRadius = cornerRadius
            }
        }
    }
    
    //MARK: - Shadow
    
    @IBInspectable open var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable open var shadowOffset: CGSize = CGSize.zero {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    //MARK: - Gradient Background
    
    @IBInspectable open var gradientEnabled: Bool = false {
        didSet {
            setupGradient()
        }
    }
    
    @IBInspectable open var gradientStartColor: UIColor = UIColor.clear {
        didSet {
            setupGradient()
        }
    }
    
    @IBInspectable open var gradientEndColor: UIColor = UIColor.clear {
        didSet {
            setupGradient()
        }
    }
    
    @IBInspectable open var gradientHorizontal: Bool = false {
        didSet {
            setupGradient()
        }
    }
    
    var gradient: CAGradientLayer?
    
    func setupGradient() {
        gradient?.removeFromSuperlayer()
        
        guard gradientEnabled != false else{
            return
        }
        
        gradient = CAGradientLayer()
        guard let gradient = gradient else { return }
        
        gradient.frame = self.layer.bounds
        gradient.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = gradientHorizontal ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 1)
        
        gradient.cornerRadius = self.cornerRadius
        
        self.layer.insertSublayer(gradient, below: self.imageView?.layer)
    }
    
    //MARK: - Animations
    
    @IBInspectable open var animatedScaleWhenHighlighted: CGFloat = 1.0
    @IBInspectable open var animatedScaleDurationWhenHighlighted: Double = 0.2
    
    override open var isHighlighted: Bool {
        didSet {
            guard animatedScaleWhenHighlighted != 1.0 else {
                return
            }
            
            if isHighlighted{
                UIView.animate(withDuration: animatedScaleDurationWhenHighlighted, animations: {
                    self.transform = CGAffineTransform(scaleX: self.animatedScaleWhenHighlighted, y: self.animatedScaleWhenHighlighted)
                })
            }
            else{
                UIView.animate(withDuration: animatedScaleDurationWhenHighlighted, animations: {
                    self.transform = CGAffineTransform.identity
                })
            }
        }
    }
    
    //MARK: - Ripple button
    
    @IBInspectable open var ripple: Bool = false
    
    @IBInspectable open var rippleColor: UIColor = UIColor(white: 1.0, alpha: 0.3)
    
    @IBInspectable open var rippleSpeed: Double = 1.0
    
    //MARK: - Image
    
    ///Image UIButton content mode
    @IBInspectable open var imageViewContentMode: Int = UIView.ContentMode.scaleToFill.rawValue {
        didSet {
            imageView?.contentMode = UIView.ContentMode(rawValue: imageViewContentMode) ?? .scaleToFill
        }
    }
    
    @IBInspectable open var imageAlpha: CGFloat = 1.0 {
        didSet {
            if let imageView = imageView {
                imageView.alpha = imageAlpha
            }
        }
    }
    
    //MARK: - Localized
    
    var localizeKeyString: String?
    
    @IBInspectable open var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.setTitle(newValue?.localized(), for: .normal)
                self.localizeKeyString = newValue
            }
        }
        get {
            return self.titleLabel?.text
        }
    }
    
    //MARK: - Underline
    
    @IBInspectable open var isUnderline: Bool = false {
        didSet {
            setupUnderline()
        }
    }
    
    func setupUnderline() {
        guard isUnderline != false else {
            return
        }
        
        guard let localizeStr = self.localizeKeyString else {
            return
        }
        
        let text = localizeStr.localized()
        
        let textRange = NSRange(location: 0, length: text.unicodeScalars.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
        self.setAttributedTitle(attributedText, for: UIControl.State.normal)
    }
    
    //MARK: - Action Closure
    
    private var action: (() -> Void)?
    
    open func touchUpInside(action: (() -> Void)? = nil){
        self.action = action
    }
    
    @objc func tapped(sender: Button) {
        self.action?()
    }
    
    //MARK: - Loading
    
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    public var isLoading: Bool = false
    
    // Show a loader inside the button, and enable or disable user interection while loading
    open func showLoader(userInteraction: Bool = true) {
        guard self.subviews.contains(indicator) == false else {
            return
        }
        
        isLoading = true
        self.isUserInteractionEnabled = userInteraction
        indicator.isUserInteractionEnabled = false
        indicator.center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        UIView.transition(with: self, duration: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel?.alpha = 0.0
            self.imageAlpha = 0.0
        }) { (finished) in
            self.addSubview(self.indicator)
            self.indicator.startAnimating()
        }
    }
    
    open func hideLoader() {
        guard self.subviews.contains(indicator) == true else {
            return
        }
        
        isLoading = false
        self.isUserInteractionEnabled = true
        self.indicator.stopAnimating()
        self.indicator.removeFromSuperview()
        UIView.transition(with: self, duration: 0.5, options: .curveEaseIn, animations: {
            self.titleLabel?.alpha = 1.0
            self.imageAlpha = 1.0
        }) { (finished) in
        }
    }

}

extension Button: CAAnimationDelegate{
    
    //MARK: Material touch animation for ripple button
    
    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        guard ripple == true else {
            return true
        }
        
        self.clipsToBounds = true
        
        let tapLocation = touch.location(in: self)
        
        let aLayer = CALayer()
        aLayer.backgroundColor = rippleColor.cgColor
        let initialSize: CGFloat = 20.0
        
        aLayer.frame = CGRect(x: 0, y: 0, width: initialSize, height: initialSize)
        aLayer.cornerRadius = initialSize/2
        aLayer.masksToBounds = true
        aLayer.position = tapLocation
        self.layer.insertSublayer(aLayer, below: self.titleLabel?.layer)
        
        // Create a basic animation changing the transform.scale value
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        // Set the initial and the final values+
        animation.toValue = 10.5 * max(self.frame.size.width, self.frame.size.height) / initialSize
        
        // Set duration
        animation.duration = rippleSpeed
        
        // Set animation to be consistent on completion
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        // Add animation to the view's layer
        let fade = CAKeyframeAnimation(keyPath: "opacity")
        fade.values = [1.0, 1.0, 0.5, 0.5, 0.0]
        fade.duration = 0.5
        
        let animGroup = CAAnimationGroup()
        animGroup.duration = 0.5
        animGroup.delegate = self
        animGroup.animations = [animation, fade]
        animGroup.setValue(aLayer, forKey: "animationLayer")
        aLayer.add(animGroup, forKey: "scale")
        
        return true
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let layer: CALayer? = anim.value(forKeyPath: "animationLayer") as? CALayer
        if layer != nil{
            layer?.removeAnimation(forKey: "scale")
            layer?.removeFromSuperlayer()
            self.clipsToBounds = false
        }
    }
}
