//
//  AxxessAlamofireManager.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/5/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AxxessAlamofireManager: NSObject {

    // MARK: Properties
    fileprivate(set) var allData: [AxxessModelObject]?
    fileprivate(set) var textData: [AxxessModelObject]?
    fileprivate(set) var imageData: [AxxessModelObject]?
    
    // MARK: Initializers
    
    static let sharedInstance: AxxessAlamofireManager = {
        let instance = AxxessAlamofireManager()
        // setup code
        
        return instance
    }()

    // MARK: Class Methods
    public func getAxxessData(completion: @escaping (_ objects: [AxxessModelObject]) -> Void) -> Void {
        
        if self.allData != nil {
            completion(allData!)
        }
        
        Alamofire.request("https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            print(response.request ?? "")  // original URL request
            print(response.response ?? "") // HTTP URL response
            print(response.data ?? "")     // server data
            print(response.result)   // result of response serialization
            
            let retJSON = JSON(response.result.value!)
            
            if (retJSON.null != nil) {
                print("JSON: \(retJSON)")
            }
            
            var retArray = [AxxessModelObject]()
            
            for aDictionary in retJSON.arrayValue {
                let aAxxessModelObject: AxxessModelObject = AxxessModelObject(withDict: aDictionary.dictionaryValue)
                retArray.append(aAxxessModelObject)

            }
            
            self.allData = retArray
            
            self.filterIntoImagesAndTextArrays()
            
            completion(retArray)
        }
    }
    
    func filterIntoImagesAndTextArrays() -> Void {
        if self.allData == nil {
            return
        }
        
        var retTextArray = [AxxessModelObject]()
        var retImageArray = [AxxessModelObject]()
        
        for aAxxessModelObject in self.allData! {
            if aAxxessModelObject.type == "text" {
                retTextArray.append(aAxxessModelObject)
            }
            else if aAxxessModelObject.type == "image" {
                retImageArray.append(aAxxessModelObject)
            }
        }
        
        self.textData = retTextArray
        self.imageData = retImageArray
    }

}
