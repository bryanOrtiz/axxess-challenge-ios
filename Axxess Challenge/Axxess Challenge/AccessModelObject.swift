//
//  AccessModelObject.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/6/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit

class AccessModelObject: NSObject {

    private(set) var id: String = ""
    private(set) var type: String = ""
    private(set) var date: String = ""
    private(set) var data: String = ""
    
    init(withDict dict: Dictionary<String, String>) {
        for (key, value) in dict {
            switch key {
            case "id":
                self.id = value
            case "type":
                self.type = value
            case "date":
                self.date = value
            case "data":
                self.data = value
            default:
                print("Default case")
            }
        }
    }
    
}
