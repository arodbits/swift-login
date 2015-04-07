//
//  JsonParser.swift
//  login
//
//  Created by Anthony Rodriguez on 4/6/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit

//Takes a NSData and return either a Dictionary Or Array
class JSONParser {
    
    let json: AnyObject?
    let error: NSError?
    
    init(data: NSData){
        self.json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error)
    }
    
    func array()->NSArray?{
        if let jsonResponse: AnyObject = self.json{
            return jsonResponse as? NSArray
        }
        return nil
    }
    
    func dictionary()->NSDictionary?{
        if let jsonResponse: AnyObject = self.json{
            return jsonResponse as? NSDictionary
        }
        return nil
    }
}