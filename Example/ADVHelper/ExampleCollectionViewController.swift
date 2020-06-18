//
//  ExampleCollectionViewController.swift
//  ADVHelper_Example
//
//  Created by ณัฐพล โพธิ์ธิมา on 16/6/2563 BE.
//  Copyright © 2563 CocoaPods. All rights reserved.
//

import UIKit
import ADVHelper

class ExampleCollectionViewController: UIViewController {

    @IBOutlet weak var dataCollectionView: CollectionView!
    
    private var names: [String] = []
    
    let cellReuseIdentifier = "cell"

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
        
        self.dataCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        self.reloadData()
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
        
    }
    
    // MARK: Private Function
    
    private func reloadData() {
        
        self.dataCollectionView.reloadData()
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

extension ExampleCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if names.count == 0 {
//            dataCollectionView.setEmptyView(messageImage: #imageLiteral(resourceName: "no_data_icon"), animated: true)
            
//            dataCollectionView.setEmptyView(title: "Data not found.")
            
//            dataCollectionView.setEmptyView(title: "Oops!", message: "Data not found.")
            
            dataCollectionView.setEmptyView(title: "Oops!", message: "Data not found.", messageImage: #imageLiteral(resourceName: "data_not_found_icon"), animated: true)
        } else {
            dataCollectionView.restore()
        }
        
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
}
