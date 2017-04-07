//
//  DetailTextViewController.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/7/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit
import SnapKit

class DetailTextViewController: UIViewController {

    // MARK: Properties
    fileprivate var axxessModelObject: AxxessModelObject?
    
    // MARK: Initializers
    convenience init(withAxxessModelObject object: AxxessModelObject) {
        self.init()
        
        self.axxessModelObject = object
    }
    
    // MARK: View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Id: " + (self.axxessModelObject?.id)!
        
        self.createUI()
    }
    
    // MARK: UI Config
    func createUI() -> Void {
        
        self.view.backgroundColor = UIColor.white
        
        let scrollView = UIScrollView()
        let contentView = UIView()
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        let dataLabel = UILabel()
        dataLabel.numberOfLines = 0
        dataLabel.lineBreakMode = .byWordWrapping
        dataLabel.text = self.axxessModelObject?.data
        dataLabel.textAlignment = .center
        
        contentView.addSubview(dataLabel)
        dataLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(16, 16, 16, 16))
        }
    }

}
