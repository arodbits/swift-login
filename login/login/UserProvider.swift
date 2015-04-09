//
//  UserProvider.swift
//  login
//
//  Created by Anthony Rodriguez on 4/8/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit


class UserProvider: Model{
    
    @NSManaged var name : NSString
    @NSManaged var access_token : NSString
    
    init(){
        super.init(table: "Users")
    }

}