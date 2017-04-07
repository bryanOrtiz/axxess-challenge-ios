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
import MBProgressHUD

class DetailImageViewController: UIViewController {

    // MARK: Properties
    fileprivate var axxessModelObject: AxxessModelObject?
    fileprivate var imageView = UIImageView()
    fileprivate let downloader = ImageDownloader() // needed strong reference so the object does not go out of scope
    
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
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        self.getImage { (image, error) in
            
            MBProgressHUD.hide(for: self.view, animated: true)

            if let error = error {
                let errorAlertController = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert)
                let errorAlertAction = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
                errorAlertController.addAction(errorAlertAction)
                self.present(errorAlertController, animated: true, completion: nil)
                return
            }
            
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.image = image
        }
    }
    
    // MARK: UI Config
    func createUI() -> Void {
        
        self.view.backgroundColor = UIColor.white
    
        self.view.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(16, 16, 16, 16))
        }
    }
    
    // MARK: Network Call
    func getImage(onCompletion completion:@escaping (_ image: UIImage?, _ error: Error?) -> Void) -> Void {
        let urlRequest = URLRequest(url: URL(string: (self.axxessModelObject?.data)!)!)
        
        self.downloader.download(urlRequest) { response in
            
            if let image = response.result.value {
                completion(image, nil)
            }
            else {
                if response.result.isFailure {
                    completion(nil, response.error)
                }
            }
        }
    }
}
