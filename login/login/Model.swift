//
//  Model.swift
//  login
//
//  Created by Anthony Rodriguez on 4/8/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Model {
    
    var context: NSManagedObjectContext?
    var entity: NSManagedObject?
    
    init(table: String){

        let db = DB();
        var _context = db.managedObjectContext!
        var _entityDescription = NSEntityDescription.entityForName(table, inManagedObjectContext: _context)
        self.entity = NSManagedObject(entity: _entityDescription!, insertIntoManagedObjectContext: _context)
        self.context = _context
        
    }
 
    
}