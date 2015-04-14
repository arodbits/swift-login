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
    
    func register(data: NSArray){
        let request = NSMutableURLRequest(URL: NSURL(string: "http://homestead.app/auth/register")!)
        request.httpMethod = "POST"
        request.timeoutInterval = 10
        
    }

}
