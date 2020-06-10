//
//  ViewController.swift
//  ADVHelper
//
//  Created by nattaponph58@nu.ac.th on 06/09/2020.
//  Copyright (c) 2020 nattaponph58@nu.ac.th. All rights reserved.
//

import UIKit
import ADVHelper

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: Label!
    @IBOutlet weak var textFieldBox: TextField!
    @IBOutlet weak var textViewBox: TextView!
    @IBOutlet weak var buttonOneBtn: Button!
    @IBOutlet weak var buttonTwoBtn: Button!
    @IBOutlet weak var buttonThreeBtn: Button!

    override func viewDidLoad() {
        super.viewDidLoad()
        onStart()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onResume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Self
    
    private func onStart() {
        self.setUpProgress()
        
        self.setUpNotificationCenter()
        
        self.setText()
    }
    
    private func onResume() {
        
    }
    
    private func setUpProgress() {
        
    }
    
    private func setUpNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    // MARK: Localized Text
    
    @objc func setText() {
        titleLabel.localizeKey = "ADVHelper".localized()
        textFieldBox.localizeKey = "Placeholder".localized()
        textViewBox.localizeKey = "Placeholder".localized()
        buttonOneBtn.localizeKey = "Button 1".localized()
        buttonTwoBtn.localizeKey = "Button 2".localized()
        buttonThreeBtn.localizeKey = "Button 3".localized()
    }
    
    // MARK: IBAction
    
    @IBAction func onButtonOneClicked(_ sender: Button) {
        if sender.isLoading {
            sender.hideLoader()
            self.changeLanguage()
        } else {
            sender.showLoader()
        }
    }
    
    @IBAction func onButtonTwoClicked(_ sender: Button) {
        if sender.isLoading {
            sender.hideLoader()
            self.changeLanguage()
        } else {
            sender.showLoader()
        }
    }
    
    @IBAction func onButtonThreeClicked(_ sender: Button) {
        if sender.isLoading {
            sender.hideLoader()
            self.changeLanguage()
        } else {
            sender.showLoader()
        }
    }
    
    // MARK: Private Function
    
    private func changeLanguage() {
        if Localize.currentLanguage() == "en" {
            Localize.setCurrentLanguage("th")
        } else {
            Localize.setCurrentLanguage("en")
        }
    }

}

