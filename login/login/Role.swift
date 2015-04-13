//
//  Role.swift
//  login
//
//  Created by Anthony Rodriguez on 4/10/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit

class Role: Model{

    @NSManaged var id: Int32
    @NSManaged var type : NSString
    
    convenience init (){
        self.init(table: "Roles")
    }

}