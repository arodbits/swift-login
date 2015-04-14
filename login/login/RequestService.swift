//
//  RequestService.swift
//  login
//
//  Created by Anthony Rodriguez on 4/14/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation

class RequestService {
    
    //Responsible for creating a NSData from a NSDictionary. Useful for POST Requests
    func bodyBuilder(data: NSDictionary)->NSData?{
        var error: NSError?
        let jsonBody = NSJSONSerialization.dataWithJSONObject(data, options: nil, error: &error)
        if error == nil{
            return nil
        }
        return jsonBody!
    }
}
