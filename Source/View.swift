//
//  View.swift
//  ADVHelper
//
//  Created by nattaponph58@nu.ac.th on 06/09/2020.
//  Copyright (c) 2020 nattaponph58@nu.ac.th. All rights reserved.
//

import UIKit

@IBDesignable
open class View: UIView {
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        gradient?.frame = self.layer.bounds
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
        didSet{
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
        
        guard gradientEnabled != false else {
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

}
