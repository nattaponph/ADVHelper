//
//  StringExtension.swift
//  ADVHelper
//
//  Created by ณัฐพล โพธิ์ธิมา on 15/6/2563 BE.
//

import Foundation

public extension String {
    
    // MARK: Date Format
    
    func dateFormat(format: String) -> String {
        let dateFormatter = DateFormatter()
        if self.count == 10 {
            dateFormatter.dateFormat = "yyyy-MM-dd"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        
        dateFormatter.locale = Locale(identifier: "en")

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = format
            dateFormatter.locale = Locale(identifier: Localize.currentLanguage())
            return dateFormatter.string(from: date)
        } else {
            return self
        }
    }
    
    func dateFormat(fromFormat: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        
        dateFormatter.locale = Locale(identifier: "en")

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat
            dateFormatter.locale = Locale(identifier: Localize.currentLanguage())
            return dateFormatter.string(from: date)
        } else {
            return self
        }
    }
    
    func dateFormat(fromFormat: String, toFormat: String, toLocaleIdentifier: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        
        dateFormatter.locale = Locale(identifier: "en")

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat
            dateFormatter.locale = Locale(identifier: toLocaleIdentifier)
            return dateFormatter.string(from: date)
        } else {
            return self
        }
    }
    
    func dateFormat(fromFormat: String, fromLocaleIdentifier: String, toFormat: String, toLocaleIdentifier: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        
        dateFormatter.locale = Locale(identifier: fromLocaleIdentifier)

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat
            dateFormatter.locale = Locale(identifier: toLocaleIdentifier)
            return dateFormatter.string(from: date)
        } else {
            return self
        }
    }
    
    // MARK: Calculate height of a multiline String
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    
}
