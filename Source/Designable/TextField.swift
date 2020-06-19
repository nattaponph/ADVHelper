//
//  TextField.swift
//  ADVHelper
//
//  Created by nattaponph58@nu.ac.th on 06/09/2020.
//  Copyright (c) 2020 nattaponph58@nu.ac.th. All rights reserved.
//

import UIKit

@IBDesignable
open class TextField: UITextField {
    
    open override func awakeFromNib() {
        setupLayer()
    }
    
    open override func prepareForInterfaceBuilder() {
        setupLayer()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        gradient?.frame = self.layer.bounds
    }
    
    func setupLayer() {
        if paddingLeftCustom == 8 {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingLeftCustom, height: frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        if paddingRightCustom == 8 {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingRightCustom, height: frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    
    //MARK: - Padding
    
    @IBInspectable open var paddingLeftCustom: CGFloat = 8 {
        didSet {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingLeftCustom, height: frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }

    @IBInspectable open var paddingRightCustom: CGFloat = 8 {
        didSet {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingRightCustom, height: frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    
    //MARK: - Border
    
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
            if borderColor != UIColor.clear && borderWidth > 0 {
                self.borderStyle = .none
            }
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
            if borderColor != UIColor.clear && borderWidth > 0 {
                self.borderStyle = .none
            }
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
        didSet{
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
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    //MARK: - Localized
    
    @IBInspectable open var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.placeholder = newValue?.localized()
            }
        }
        get {
            return self.placeholder
        }
    }

}


