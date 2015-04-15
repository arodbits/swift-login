//
//  RegisterAndSignUp.swift
//  login
//
//  Created by Anthony Rodriguez on 4/13/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation

enum httpReponseType: Int{
    case ok = 200, unauthorized = 404
}

class Register{
    
    let taskHandler = DataTaskHandler()
    
    func register(data: NSDictionary)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://homestead.app/auth/register")!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        request.HTTPMethod = "POST"
        
        var error: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(data, options: nil, error: &error)
        if error == nil
        {
            taskHandler.execute(request, handler: { (data, response, error) -> Void in
                //No error found
                if error == nil
                {
                    if let httpReponse = response as? NSHTTPURLResponse
                    {
                        switch (httpReponse.statusCode)
                        {
                            case 200 :
                                println("The user has been registered correctly")
                                break
                            case 404 :
                                println("error")
                                break
                            default :
                                break
                        }
                    }
                    
                }
            })
        }
    }
}
