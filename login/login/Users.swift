//
//  User.swift
//  login
//
//  Created by Anthony Rodriguez on 4/7/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import CoreData

class Users: NSManagedObject {

    @NSManaged var access_token: String
    @NSManaged var name: String

}
