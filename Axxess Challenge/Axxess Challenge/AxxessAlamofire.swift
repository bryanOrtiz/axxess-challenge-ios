//
//  AxxessAlamofire.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/5/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AxxessAlamofire: NSObject {

    static let sharedInstance: AxxessAlamofire = {
        let instance = AxxessAlamofire()
        // setup code
        
        return instance
    }()

    
    public func getJSON() -> (() -> JSON) {
        let retString = "Bryan"
        func getJSONViaAlamofire () -> JSON {
            var retJSON : JSON?
            func retAlamoFireFunc () -> DataRequest {
                return Alamofire.request("https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { response in
                    print(response.request ?? "")  // original URL request
                    print(response.response ?? "") // HTTP URL response
                    print(response.data ?? "")     // server data
                    print(response.result)   // result of response serialization
                    
                    retJSON = JSON(response.result.value!)
                    
                    if (retJSON?.null != nil) {
                        print("JSON: \(retJSON!)")
                    }
                }
            }
        return retJSON!
        }
        return getJSONViaAlamofire
    }
    
    public func getJSONV2() -> (() -> DataRequest) {
        var retJSON : JSON?
        func retAlamoFireFunc () -> DataRequest {
            return Alamofire.request("https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { response in
                
                print(response.request ?? "")  // original URL request
                print(response.response ?? "") // HTTP URL response
                print(response.data ?? "")     // server data
                print(response.result)   // result of response serialization
                
                
                func getRealJSONVal () -> JSON {
                    retJSON = JSON(response.result)
                    
                    if (retJSON?.null != nil) {
                        print("JSON: \(retJSON!)")
                    }
                    
                    return retJSON!
                }
            }
        }
        return retAlamoFireFunc
    }
}
