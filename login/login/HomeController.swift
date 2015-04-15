//
//  HomeController.swift
//  login
//
//  Created by Anthony Rodriguez on 4/2/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController{
    
    @IBOutlet weak var name: UILabel!
    
    var nameHolder: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NSOperationQueue.mainQueue().addOperationWithBlock(
        {
//            self.performSegueWithIdentifier("homeToLogin", sender: AnyObject?())
        })
        
        name.text = nameHolder
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if (segue.identifier == "homeToLogin")
        {
            
        }
        else if (segue.identifier == "homeToLogin")
        {

        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
