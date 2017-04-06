//
//  DetailImageViewController.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/6/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage

class DetailImageViewController: UIViewController {

    // MARK: Properties
    fileprivate var axxessModelObject: AxxessModelObject?
    fileprivate c
    
    // MARK: Initializers
    convenience init(withAxxessModelObject object: AxxessModelObject) {
        self.init()
        
        self.axxessModelObject = object
    }
    
    // MARK: View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: UI Config
    func createUI() -> Void {
        let idLabel = UILabel()
        idLabel.text = "Id: " + (self.axxessModelObject?.id)!
        idLabel.textAlignment = .center
        
        self.view.addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview().offset(-16.0)
        }
        
        
    }
}
