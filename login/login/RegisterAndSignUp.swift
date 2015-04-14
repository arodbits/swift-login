//
//  RegisterAndSignUp.swift
//  login
//
//  Created by Anthony Rodriguez on 4/13/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation

class RegisterAndSignUp{
    
    let taskHandler = DataTaskHandler()
    let requestService = RequestService()
    
    func register(data: NSDictionary){
        let request = NSMutableURLRequest(URL: NSURL(string: "http://homestead.app/auth/register")!)
        request.HTTPMethod = "POST"
        request.timeoutInterval = 10
        let jsonBody = requestService.bodyBuilder(data)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = jsonBody
        taskHandler.make(request, handler: { (result, error) -> Void in
            println(NSString(data: result!, encoding: NSUTF8StringEncoding))
        })
    }
    
    

}
