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
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue)
    {
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let auth = Auth()
        if let authenticated = auth.check()
        {
            println("Authenticated")
        }
        else{
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                self.performSegueWithIdentifier("homeToLogin", sender: AnyObject?())
            })
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if (segue.identifier == "homeToLogin")
        {
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                var loginController = segue.destinationViewController as? LogInController
            })
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
