//
//  RegisterAndSignUp.swift
//  login
//
//  Created by Anthony Rodriguez on 4/13/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation

class Register{
    
    let taskHandler = DataTaskHandler()

    
    func register(data: NSDictionary){
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://homestead.app/auth/register")!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        request.HTTPMethod = "POST"
        
        var error: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(data, options: nil, error: &error)
        if error == nil{
            
            taskHandler.make(request, handler: { (result, error) -> Void in
                println(NSString(data: result!, encoding: NSUTF8StringEncoding))
            })
        }
        
    }
}
