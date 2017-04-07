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

    private(set) var id: String = "NO ID PROVIDED"
    private(set) var type: String = "NO TYPE PROVIDED"
    private(set) var date: String = "NO DATE PROVIDED"
    private(set) var data: String = "NO DATA PROVIDED"
    
    init(withDict dict: Dictionary<String, JSON>) {
        for (key, value) in dict {
            let newValue = value.stringValue.isEmpty ? "NO DATA PROVIDED" : value.stringValue
            switch key {
            case "id":
                self.id = newValue
            case "type":
                self.type = newValue
            case "date":
                self.date = newValue
            case "data":
                self.data = newValue
            default:
                print("Default case")
            }
        }
    }
    
}
