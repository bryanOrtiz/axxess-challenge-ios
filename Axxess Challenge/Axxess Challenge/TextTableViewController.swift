//
//  TextTableViewController.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/6/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit

class TextTableViewController: UITableViewController {

    fileprivate var textData = [AxxessModelObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Text"
        
        self.tableView.register(ExcludingTypeFieldTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        self.tableView.estimatedRowHeight = 40.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView()
        
        self.textData = AxxessAlamofire.sharedInstance.textData!
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.textData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExcludingTypeFieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ExcludingTypeFieldTableViewCell
        
        let aAxxessModelObject = self.textData[indexPath.row]
        
        cell.idDetailLabel.text = aAxxessModelObject.id
        cell.dateDetailLabel.text = aAxxessModelObject.date
        cell.dataDetailLabel.text = aAxxessModelObject.data
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let axxessModelObject = self.textData[indexPath.row]
        let detailImageVC = DetailTextViewController(withAxxessModelObject: axxessModelObject)
        self.navigationController?.pushViewController(detailImageVC, animated: true)
    }

}
