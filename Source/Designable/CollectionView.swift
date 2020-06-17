//
//  CollectionView.swift
//  ADVHelper
//
//  Created by ณัฐพล โพธิ์ธิมา on 16/6/2563 BE.
//

import UIKit

@IBDesignable
open class CollectionView: UICollectionView {
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
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
    
    //MARK: - EmptyView
    
    //  Custom Size Image
    open var imageSizePercentage: Percentage = .percentage75
    
    //  Custom Color & Font
    open var titleColor = UIColor.black
    open var titleFont = UIFont(name: "HelveticaNeue-Bold", size: 18)
    
    open var messageColor = UIColor.lightGray
    open var messageFont = UIFont(name: "HelveticaNeue-Regular", size: 17)
    
    //  Set Only Image Empty View
    open func setEmptyView(messageImage: UIImage, animated: Bool) {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let messageImageView = UIImageView()
        
        let imageSize = CGFloat(imageSizePercentage.rawValue) / 100 * self.bounds.size.width
        
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        
        messageImageView.backgroundColor = .clear
        messageImageView.image = messageImage
        
        emptyView.addSubview(messageImageView)
        
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: 0).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        if animated {
            UIView.animate(withDuration: 1, animations: {
                messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
            }, completion: { (finish) in
                UIView.animate(withDuration: 1, animations: {
                    messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
                }, completion: { (finishh) in
                    UIView.animate(withDuration: 1, animations: {
                        messageImageView.transform = CGAffineTransform.identity
                    })
                })
                
            })
        }
        
        self.backgroundView = emptyView
    }
    
    //  Set Only Title Empty View
    open func setEmptyView(title: String) {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        emptyView.addSubview(titleLabel)
        
        titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -8).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        
        self.backgroundView = emptyView
    }
    
    //  Set Title And Message Empty View
    open func setEmptyView(title: String, message: String) {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        messageLabel.textColor = messageColor
        messageLabel.font = messageFont
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        let titleHeight = titleLabel.text?.heightWithConstrainedWidth(width: emptyView.frame.width - 16, font: titleLabel.font) ?? 0
        let messageHeight = messageLabel.text?.heightWithConstrainedWidth(width: emptyView.frame.width - 16, font: titleLabel.font) ?? 0 + 10
        let centerYConstant = -(((titleHeight + messageHeight) / 2) - (titleHeight / 2))
        
        titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -8).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: centerYConstant).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 8).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -8).isActive = true
        
        self.backgroundView = emptyView
    }
    
    //  Set Full Empty View
    open func setEmptyView(title: String, message: String, messageImage: UIImage, animated: Bool) {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        let imageSize = CGFloat(imageSizePercentage.rawValue) / 100 * self.bounds.size.width
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageImageView.backgroundColor = .clear
        messageImageView.image = messageImage
        
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        messageLabel.textColor = messageColor
        messageLabel.font = messageFont
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        emptyView.addSubview(messageLabel)
        
        let titleHeight = titleLabel.text?.heightWithConstrainedWidth(width: emptyView.frame.width - 16, font: titleLabel.font) ?? 0 + 10
        let messageHeight = messageLabel.text?.heightWithConstrainedWidth(width: emptyView.frame.width - 16, font: titleLabel.font) ?? 0 + 10
        let centerYConstant = -(titleHeight + messageHeight) / 2
        
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: centerYConstant).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -8).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 8).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -8).isActive = true
        
        if animated {
            UIView.animate(withDuration: 1, animations: {
                messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
            }, completion: { (finish) in
                UIView.animate(withDuration: 1, animations: {
                    messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
                }, completion: { (finishh) in
                    UIView.animate(withDuration: 1, animations: {
                        messageImageView.transform = CGAffineTransform.identity
                    })
                })
                
            })
        }
        
        self.backgroundView = emptyView
    }
    
    //  Set Restore
    open func restore(_ style: UITableViewCell.SeparatorStyle = .singleLine) {
        self.backgroundView = nil
    }

}
