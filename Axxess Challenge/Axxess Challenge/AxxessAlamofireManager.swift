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

/// This singleton gets the bulk of our data. It manages our data into three separate Arrays: 
/// allData - which is all data regardless of type, 
/// textData - which is specific to those of type "text"
/// imageData - which is specific to those of type "image"
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
    
    /// This our main network call. It helps us to also "cache" the data we get back to a single property.
    /// allData. If we have it cached, then return out completion block with data we need instead of making 
    /// multiple network calls.
    ///
    /// - Parameter completion: Our completion acts as an Objective-C block in that it executes after we have
    /// made our network call and depending on wheather Alamofire succeeded or not, it will return an array
    /// of parsed data from the raw JSON or an error if it fails. This completion is an optional so if we only
    /// want to execute the function and not hit the completion we can.
    public func getAxxessData(completion: ((_ objects: [AxxessModelObject]?, _ error: Error?) -> Void)? = nil) -> Void {
        
        if self.allData != nil {
            completion!(allData!, nil)
        }
        
        Alamofire.request("https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            if response.result.isFailure {
                if completion != nil {
                    completion!(nil, response.result.error)
                }
            }
            
            let retJSON = JSON(response.result.value!)
            
            var retArray = [AxxessModelObject]()
            
            for aDictionary in retJSON.arrayValue {
                let aAxxessModelObject: AxxessModelObject = AxxessModelObject(withDict: aDictionary.dictionaryValue)
                retArray.append(aAxxessModelObject)

            }
            
            self.allData = retArray
            
            self.filterIntoImagesAndTextArrays()
            if completion != nil {
                completion!(retArray, nil)
            }
        }
    }
    
    /// Convenience method that filters our data for us
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
