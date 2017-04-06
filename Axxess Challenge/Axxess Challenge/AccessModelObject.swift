//
//  AxxessModelObject.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/6/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit
import SwiftyJSON

class AxxessModelObject: NSObject {

    private(set) var id: String = ""
    private(set) var type: String = ""
    private(set) var date: String = ""
    private(set) var data: String = ""
    
    init(withDict dict: Dictionary<String, JSON>) {
        for (key, value) in dict {
            switch key {
            case "id":
                self.id = value.stringValue
            case "type":
                self.type = value.stringValue
            case "date":
                self.date = value.stringValue
            case "data":
                self.data = value.stringValue
            default:
                print("Default case")
            }
        }
    }
    
}
