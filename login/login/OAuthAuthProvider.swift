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




struct OAuthTokenRequest {
    
    //  Define configuration variables
    let client_id       = "QldBvenYfVoOqGCT"
    let client_secret   = "rlLlSVoUBGJ37NM61zOuK1mvRBwKstmg"
    let grant_type      = "password"
    
    var bodyDataString: String {
        return "grant_type=\(self.grant_type)&client_id=\(self.client_id)&client_secret=\(client_secret)&password=\(self.credentials.password)&username=\(self.credentials.password)"
    }
    
    var credentials: Credentials
    
    init(credentials: Credentials){
        self.credentials = credentials
    }
    
    

    
    
    
}


class OAuthAuthProvider {
//  Base URL
    let baseUrl         = NSURL(string: "http://homestead.app/")


//  Asynchronous call, returning a hanlder
    func request(type: RequestType, request: NSMutableURLRequest, handler : ()?){
        switch type
        {
            case .get :
                
            break
            case .post :
            
            break
        }
    }
//  Asynchronous call, returning a hanlder
    func getAccessToken(credentials: Credentials, handler: (token: String?, error: String?)){
        
//        url
//        credentials
//        parameters
//        check the result
//        return handlerWithAccessToken
        
        let url = NSURL(string: "http://homestead.app/oauth/access_token", relativeToURL: self.baseUrl)
        let oauthTokenRequest = OAuthTokenRequest(credentials: credentials)
        
        self.request(type: RequestType.get, request: request, handler: {()->Void in
        
        })
        
    }
}


let request     = NSMutableURLRequest(URL: params.url)
let username    = params.username
let password    = params.password
let bodyData    = "grant_type=\(self.grant_type)&username=\(username)&password=\(password)&client_id=\(self.client_id)&client_secret=\(self.client_secret)"
request.HTTPMethod = "POST"
request.HTTPBody
