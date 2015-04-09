//
//  login.swift
//  login
//
//  Created by Anthony Rodriguez on 4/8/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import CoreData

class login: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var access_token: String

}
