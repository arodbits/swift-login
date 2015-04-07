//
//  DataTaskHandler.swift
//  login
//
//  Created by Anthony Rodriguez on 4/6/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit



class DataTaskHandler {

    let session = NSURLSession.sharedSession()
    
    func make (request: NSMutableURLRequest, handler: (result: NSData?, error: String?)->Void){
        
        let task = session.dataTaskWithRequest(request, completionHandler: {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
//          No errors
            if error == nil
            {
//              Check the status code
                let HTTPResponse = response as NSHTTPURLResponse?
                if let res = HTTPResponse
                {
//                  Successfully (200): The username and Password are correct
                    if res.statusCode == 200
                    {
                        handler(result: data, error: nil)
                    }
                    else if res.statusCode == 401
                    {
                        handler(result:nil, error: "Authorization error")
                    }
                }
            }
        })
        task.resume()
    }
}






