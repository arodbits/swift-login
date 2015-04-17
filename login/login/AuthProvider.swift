//
//  AuthProviderInterface.swift
//  login
//
//  Created by Anthony Rodriguez on 4/15/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation

protocol AuthProvider{

    func check()->String?
    
    func me(handler: (data: NSDictionary?, error: String?)->Void)->Void
    
  

}