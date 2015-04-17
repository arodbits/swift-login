//
//  Auth.swift
//  login
//
//  Created by Anthony Rodriguez on 4/15/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
//Auth Handler

class Auth {

    let authProvider: AuthProvider
    
    init(){
        self.authProvider = OAuthAuthProvider()
    }
    
    func check()->String?{
        return self.authProvider.check()
    }
    
    func user(handler: (data: NSDictionary?, error: String?)->Void){
        self.authProvider.me(handler)
    }
    
    func logout(){
        self.authProvider.logout()
    }
  

}
