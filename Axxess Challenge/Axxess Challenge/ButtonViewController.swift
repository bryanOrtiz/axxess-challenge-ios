//
//  ButtonViewController.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/6/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit
import SnapKit


/// Main View controller that will allow the user to either see All data, Text ONLY, or Images ONLY
class ButtonViewController: UIViewController {

    // MARK: View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.configUI()
    }
    
    // MARK: Configure UI
    func configUI() -> Void {
        let allButton = UIButton()
        allButton.setTitle("All", for: .normal)
        allButton.setTitleColor(.blue, for: .normal)
        allButton.addTarget(self, action: #selector(displayAllViewController), for: .touchUpInside)
        
        let textOnlyButton = UIButton()
        textOnlyButton.setTitle("Text", for: .normal)
        textOnlyButton.setTitleColor(.blue, for: .normal)
        textOnlyButton.addTarget(self, action: #selector(displayTextViewController), for: .touchUpInside)
        
        let imagesOnlyButton = UIButton()
        imagesOnlyButton.setTitle("Images", for: .normal)
        imagesOnlyButton.setTitleColor(.blue, for: .normal)
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
    
    // MARK: Navigation
    func displayAllViewController() -> Void {
        let allTableVC = AllTableViewController()
        self.displayViewControllerWithNavController(viewController: allTableVC)
    }
    
    func displayTextViewController() -> Void {
        let textTableVC = TextTableViewController()
        self.displayViewControllerWithNavController(viewController: textTableVC)
    }
    
    func displayImagesViewController() -> Void {
        let imageTableVC = ImagesTableViewController()
        self.displayViewControllerWithNavController(viewController: imageTableVC)
    }
    
    /// Created abstraction to present a UINavigationController with a root UIViewController
    ///
    /// - Parameter viewController: this view controller will become the root view controller of the 
    /// of the UINavigationController
    func displayViewControllerWithNavController(viewController: UIViewController) -> Void {
        let navController = UINavigationController(rootViewController: viewController)
        
        let dismissNavBarButton = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissNavControllerAction))
        viewController.navigationItem.leftBarButtonItem = dismissNavBarButton
        
        present(navController, animated: true, completion: nil)
    }
    
    // MARK: Actions
    func dismissNavControllerAction() -> Void {
        self.dismiss(animated: true, completion: nil)
    }
}
