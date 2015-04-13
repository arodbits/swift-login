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

class Model: NSManagedObject {
    
    var context: NSManagedObjectContext?
    var table: String?
    
    convenience init(table: String){
        let db = DB();
        var _context = db.managedObjectContext!
        var _entityDescription = NSEntityDescription.entityForName(table, inManagedObjectContext: _context)
        self.init(entity: _entityDescription!, insertIntoManagedObjectContext: _context)
        self.context = _context
        self.table = table
        
    }
    
    func save() -> NSError?{
        var error: NSError?
        self.context?.save(&error)
        return error
    }
    
    func all() ->(result: AnyObject?,error: NSError?){
        let request = NSFetchRequest(entityName: self.table!)
        var error: NSError?
        let fetched = self.context?.executeFetchRequest(request, error: &error)
        if let result = fetched {
            return (result: result, error: nil)
        }
        return (result: nil, error: error)
    }
    
}