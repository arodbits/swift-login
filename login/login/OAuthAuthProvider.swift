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
    let client_id       = "QldBvenYfVoOqGCT"
    let client_secret   = "rlLlSVoUBGJ37NM61zOuK1mvRBwKstmg"
    let grant_type      = "password"
    let url: NSURL?
    
    var bodyDataString: NSData {
        let bodyComposition = "grant_type=\(self.grant_type)&client_id=\(self.client_id)&client_secret=\(client_secret)&password=\(self.credentials.password)&username=\(self.credentials.password)"
        return bodyComposition.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    var credentials: Credentials
    
    init(credentials: Credentials, baseUrl: NSURL){
        self.credentials = credentials
        self.url = NSURL(string: "/access_token", relativeToURL: baseUrl)
    }
    
    func request(handler: (result: NSData?, error: String?)->Void){
        let request = NSMutableURLRequest(URL: self.url!)
        request.HTTPMethod = "POST"
        request.HTTPBody = self.bodyDataString
        let taskInstance = DataTaskHandler()
//      Async call
        taskInstance.make(request, handler: handler)
    }
    
}

class OAuthAuthProvider {
//  Base URL
    let baseUrl         = NSURL(string: "http://homestead.app/")

//  Asynchronous call, returning a hanlder
    func getAccessToken(credentials: Credentials, handler: (token: String?, error: String?)){
        let oauthTokenInstance = OAuthToken(credentials: credentials, baseUrl: self.baseUrl!)
        oauthTokenInstance.request { (result, error) -> Void in
            
        }
    }
}






