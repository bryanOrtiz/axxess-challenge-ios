//
//  ButtonViewController.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/6/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit
import SnapKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let allButton = UIButton()
        allButton.setTitle("All", for: .normal)
        allButton.addTarget(self, action: #selector(displayAllViewController), for: .touchUpInside)
        
        let textOnlyButton = UIButton()
        textOnlyButton.setTitle("Text", for: .normal)
        textOnlyButton.addTarget(self, action: #selector(displayTextViewController), for: .touchUpInside)
        
        let imagesOnlyButton = UIButton()
        imagesOnlyButton.setTitle("Images", for: .normal)
        imagesOnlyButton.addTarget(self, action: #selector(displayImagesViewController), for: .touchUpInside)
        
        self.view.addSubview(allButton)
        allButton.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(self.view)
        }
        
        self.view.addSubview(textOnlyButton)
        textOnlyButton.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self.view)
            make.top.equalTo(allButton.snp.bottom)
            make.height.equalTo(allButton)
        }
        
        self.view.addSubview(imagesOnlyButton)
        imagesOnlyButton.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self.view)
            make.top.equalTo(textOnlyButton.snp.bottom)
            make.height.equalTo(textOnlyButton)
        }
    }
    
    func displayAllViewController() -> Void {
        
    }
    
    func displayTextViewController() -> Void {
        
    }
    
    func displayImagesViewController() -> Void {
        
    }

}
