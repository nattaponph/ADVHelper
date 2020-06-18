//
//  ExampleTableViewController.swift
//  ADVHelper_Example
//
//  Created by ณัฐพล โพธิ์ธิมา on 16/6/2563 BE.
//  Copyright © 2563 CocoaPods. All rights reserved.
//

import UIKit
import ADVHelper

class ExampleTableViewController: UIViewController {
    
    @IBOutlet weak var dataTableView: TableView!
    
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
        
        self.dataTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
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
        
        self.dataTableView.reloadData()
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

extension ExampleTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if names.count == 0 {
            dataTableView.imageSizePercentage = .percentage80
            
//            dataTableView.setEmptyView(messageImage: #imageLiteral(resourceName: "no_data_icon"), animated: true)
            
//            dataTableView.setEmptyView(title: "Data not found.")
            
//            dataTableView.setEmptyView(title: "Oops!", message: "Data not found.")
            
            dataTableView.setEmptyView(title: "Oops!", message: "Data not found.", messageImage: #imageLiteral(resourceName: "data_not_found_icon"), animated: true)
        } else {
            dataTableView.restore()
        }
        
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        cell.textLabel?.text = self.names[indexPath.row]

        return cell
    }
    
}
