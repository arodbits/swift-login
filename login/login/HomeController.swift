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

    var auth = Auth()
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue)
    {
       
    }
    @IBAction func logout(sender: AnyObject) {
        self.auth.logout()
        self.performSegueWithIdentifier("homeToLogin", sender: AnyObject?())
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        if let authenticated = self.auth.check()
        {
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            self.auth.user({ (data, error) -> Void in
                if let result = data {
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        self.name.text =  result["name"] as? String
                    })
                }
            })
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
