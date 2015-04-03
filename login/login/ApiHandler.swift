//
//  ApiHandler.swift
//  login
//
//  Created by Anthony Rodriguez on 4/3/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit

struct LoginWithPasswordParams{
    var username: String
    var password: String
    var url: NSURL
    
    init(username: String, password: String, url: NSURL){
        self.username = username
        self.password = password
        self.url = url
    }
}

class ApiHandler {

    let baseUrl         = NSURL(string: "http://homestead.app/")
    let client_id       = "QldBvenYfVoOqGCT"
    let client_secret   = "rlLlSVoUBGJ37NM61zOuK1mvRBwKstmg"
    let grant_type      = "password"
    let session         = NSURLSession.sharedSession()
    var access_token: String? = nil
    
    func getAccessToken(username: String, password: String, handler: (access_token: String?, error: String?)->Void) {
        let accessTokenUrl = NSURL(string: "oauth/access_token", relativeToURL: baseUrl)
        if username != " " && password != " " {
            let params = LoginWithPasswordParams(username: username, password: password, url: accessTokenUrl!)
            let request = self.accessTokenPostRequest(params)
            let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
//              No errors
                if error == nil
                {
//                  Check the status code
                    let HTTPResponse = response as NSHTTPURLResponse?
                    if let res = HTTPResponse
                    {
//                      Successfully (200): The username and Password are correct
                        if res.statusCode == 200
                        {
                            var er: NSError?
                            let json = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: &er) as? NSDictionary
                            if let jsonResult = json {
                                self.access_token = jsonResult["access_token"] as? String
                                handler(access_token: jsonResult["access_token"] as? String, error: nil)
                            }
                        }
//                      Unauthorized: (401)
                        else if res.statusCode == 401
                        {
//                          Error
                            handler(access_token: nil, error: "The username or password is not correct. Try again, please.")
                        }
                    }
                }

            })
            task.resume()
        }
    }
    
    func me(handler: (name: String)->Void){
        println("working")
        let meURL = NSURL(string: "/me", relativeToURL: self.baseUrl)
        let request = self.getRequest(meURL!)
        var er: NSError?
        
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            //println(NSString(data: data, encoding: NSUTF8StringEncoding))
            let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &er) as? NSDictionary
            if let jsonResult = json {
                
                handler(name: jsonResult["name"] as String!)
            }
        })
        task.resume()
    }
    
    func getRequest(url: NSURL)-> NSMutableURLRequest{
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.setValue("Bearer \(self.access_token!)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func accessTokenPostRequest(params: LoginWithPasswordParams)->NSURLRequest{
        let request     = NSMutableURLRequest(URL: params.url)
        let username    = params.username
        let password    = params.password
        let bodyData    = "grant_type=\(self.grant_type)&username=\(username)&password=\(password)&client_id=\(self.client_id)&client_secret=\(self.client_secret)"
        request.HTTPMethod = "POST"
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
        return request
    }
}
