//
//  OAuthAuthProvider.swift
//  login
//
//  Created by Anthony Rodriguez on 4/6/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit

enum RequestType {
    case get, post
}

struct Credentials {
    var username: String
    var password: String
}

struct OAuthToken {
    
    //  Define configuration variables
    let client_id       = "GwcqkiZXvMexepc1"
    let client_secret   = "oJS2bjRoBDYwyZp8RqC62aCb44Md1RC6"
    let grant_type      = "password"
    let url: NSURL?
    var bodyDataString: NSData
    {
        let bodyComposition = "grant_type=\(self.grant_type)&client_id=\(self.client_id)&client_secret=\(client_secret)&password=\(self.credentials.password)&username=\(self.credentials.username)"
        
        println(bodyComposition)
        return bodyComposition.dataUsingEncoding(NSUTF8StringEncoding)!

    }
    
    var credentials: Credentials
    
    init(credentials: Credentials, baseUrl: NSURL)
    {
        self.credentials = credentials
        self.url = NSURL(string: "/oauth/access_token", relativeToURL: baseUrl)
        
    }
    
    func request(handler: (result: NSData?, error: String?)->Void)
    {
        let request = NSMutableURLRequest(URL: self.url!)
        request.HTTPMethod = "POST"
        request.HTTPBody = self.bodyDataString
        let taskInstance = DataTaskHandler()
        
//      Async dataTaskWithRequest
        taskInstance.make(request, handler: handler)
    }
}

class OAuthAuthProvider: AuthProvider {
    
    //Base URL
    let baseUrl = NSURL(string: "http://homestead.app/")
    let userDefault: NSUserDefaults
    
    init(){
        self.userDefault = NSUserDefaults.standardUserDefaults()
    }
    
    //Check whether the user is currently authenticated
    func check()->String? {
        //If the user is authenticated, a valid access_token must be available
        return self.getAccessToken()
    }
    
    func attempt(credentials: Credentials, handler: (token: String?, error: String?)->Void){
        let oauthTokenInstance = OAuthToken(credentials: credentials, baseUrl: self.baseUrl!)
        //handle the response. Get token and store it
        oauthTokenInstance.request({ (result, error) -> Void in
            if let res = result
            {
                if let jsonDictionary = JSONParser(data: res).dictionary(){
                    let token = jsonDictionary["access_token"] as? String
                    self.userDefault.setObject(token , forKey: "token")
                    handler(token: self.getAccessToken()!, error: error)
                }
                
            }else
            {
                handler(token: nil, error:error)
            }
        })
    }
    
    
    //Asynchronous call, returning a handler
    func getAccessToken()->String?
    {
        return self.userDefault.valueForKey("token") as? String
    }
    
    func me(handler: (data: NSDictionary?, error: String?) -> Void)
    {
        let url = NSURL(string: "/me", relativeToURL: self.baseUrl)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        // The request is valid only if the access_token exists
        if let t = self.getAccessToken()
        {
            request.setValue("Bearer \(t)", forHTTPHeaderField: "Authorization")
            let taskInstance = DataTaskHandler()
            taskInstance.make(request, handler: { (result, error) -> Void in
                if let res = result
                {
                    if let jsonDictionary = JSONParser(data: res).dictionary()
                    {
                        println(jsonDictionary)
                        handler(data: jsonDictionary, error: nil)
                    }
                }
            })
        }
        else
        {
            handler(data:nil, error: "The access token is not available")
        }
    }
    
    func logout(){
        self.userDefault.removeObjectForKey("token")
    }
}






