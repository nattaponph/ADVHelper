//
//  ForScreenshotViewController.swift
//  ADVHelper_Example
//
//  Created by ณัฐพล โพธิ์ธิมา on 17/6/2563 BE.
//  Copyright © 2563 CocoaPods. All rights reserved.
//

import UIKit
import ADVHelper

class ForScreenshotViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: Label!

    override func viewDidLoad() {
        super.viewDidLoad()
        onStart()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onResume()
    }
    
    // MARK: - Self
    
    private func onStart() {
        self.setUpProgress()
        
        self.setUpNotificationCenter()
        
        self.setText()
    }
    
    private func onResume() {
        let inputDateStr = "2020-06-17 10:20:30"
        titleLabel.text = inputDateStr.dateFormat(<#T##fromFormat: String##String#>, <#T##fromLocaleIdentifier: String##String#>, <#T##toFormat: String##String#>, <#T##toLocaleIdentifier: String##String#>)
    }
    
    private func setUpProgress() {
        
    }
    
    private func setUpNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    // MARK: Localized Text
    
    @objc func setText() {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
