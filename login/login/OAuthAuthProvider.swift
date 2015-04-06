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

class OAuthAuthProvider {
    
//  Define configuration variables
    let baseUrl         = NSURL(string: "http://homestead.app/")
    let client_id       = "QldBvenYfVoOqGCT"
    let client_secret   = "rlLlSVoUBGJ37NM61zOuK1mvRBwKstmg"
    let grant_type      = "password"

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
        let request = 
        self.request(type: get, request: <#NSMutableURLRequest#>, handler: <#()?#>)
        
    }
}
