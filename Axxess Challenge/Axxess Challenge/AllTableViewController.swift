//
//  AllTableViewController.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/6/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit

class AllTableViewController: UITableViewController {

    fileprivate var allData = [AxxessModelObject]()
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "All"
        
        self.tableView.register(BasicStringTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        self.tableView.estimatedRowHeight = 40.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView()
        
        AxxessAlamofireManager.sharedInstance.getAxxessData { (axxessModelObjects, error) in
            
            if let error = error {
                let alertController = UIAlertController(title: "ERROR", message: error.localizedDescription + "\n Check your internet connection. Go back to main screen and try again.", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            self.allData = axxessModelObjects!
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.allData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BasicStringTableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! BasicStringTableViewCell
        
        let aAxxessModelObject = self.allData[indexPath.row]
        
        cell.idDetailLabel.text = aAxxessModelObject.id
        cell.typeDetailLabel.text = aAxxessModelObject.type
        cell.dateDetailLabel.text = aAxxessModelObject.date
        cell.dataDetailLabel.text = aAxxessModelObject.data
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let axxessModelObject = self.allData[indexPath.row]
        
        let detailVC: UIViewController?
        
        switch axxessModelObject.type {
        case "text",
             "other":
            detailVC = DetailTextViewController(withAxxessModelObject: axxessModelObject)
        case "image":
            detailVC = DetailImageViewController(withAxxessModelObject: axxessModelObject)
        default:
            detailVC = DetailTextViewController(withAxxessModelObject: axxessModelObject)
        }
        
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}
