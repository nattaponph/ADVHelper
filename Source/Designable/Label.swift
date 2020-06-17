//
//  Label.swift
//  ADVHelper
//
//  Created by nattaponph58@nu.ac.th on 06/09/2020.
//  Copyright (c) 2020 nattaponph58@nu.ac.th. All rights reserved.
//

import UIKit

@IBDesignable
open class Label: UILabel {
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        setupUnderline()
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
        }
    }
    
    //MARK: - Shadow
    
    @IBInspectable open var shadowsColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowsColor.cgColor
        }
    }
    
    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable open var shadowsOffset: CGSize = CGSize.zero {
        didSet {
            self.layer.shadowOffset = shadowsOffset
        }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    //MARK: - Localized
    
    @IBInspectable open var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.text = newValue?.localized()
            }
        }
        get {
            return self.text
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
        
        guard let text = self.text else {
            return
        }
        
        let textRange = NSRange(location: 0, length: text.unicodeScalars.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
        self.attributedText = attributedText
    }

}

