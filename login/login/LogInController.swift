//
//  ViewController.swift
//  login
//
//  Created by Anthony Rodriguez on 3/27/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class LogInController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        // activityIndicator is hidden when it's stopped
        self.activityIndicatorView.hidesWhenStopped = true
        
        let users = User()
        users.name = "Josephx"
        
        if let error = users.save(){
              println("Could not save \(error), \(error.userInfo)")
        }
        
        if let allUsers: AnyObject = users.all().result{
            println(allUsers.valueForKey("name"))
        }else{
        
        }
        
        let roles = Role()
        roles.id = 1
        roles.type = "Admin"
        roles.save()
        
        if let r = roles.all().result{
            println(r.valueForKey("type"))
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        let appDedelegate: AppDelegate = (UIApplication.sharedApplication()).delegate as! AppDelegate

        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "loginToHome"){
            var homeViewController = segue.destinationViewController as! HomeController
            homeViewController.nameHolder = sender as? String
        }
        if (segue.identifier == "loginToSignup"){
            var homeViewController = segue.destinationViewController as! SignUpController
        }
    }
    
    @IBAction func signUpPressed(sender: AnyObject) {
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.performSegueWithIdentifier("loginToSignup", sender: AnyObject?())
        })
    }

    @IBAction func SignInPressed(sender: AnyObject) {
        //let api = ApiHandler()
        let auth = OAuthAuthProvider()
        if email.hasText() && password.hasText()
        {
            self.activityIndicatorView.startAnimating()
            let credentials = Credentials(username: email.text, password: password.text)
            auth.getAccessToken(credentials, handler: { (token, error) -> Void in
                self.mainDispatcher({ () -> Void in
                    self.activityIndicatorView.stopAnimating()
                })
                if error != nil
                {
                    self.mainDispatcher({ () -> Void in
                        let alert = UIAlertController(title: "I'm Sorry", message: error, preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style:UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    })
                }
                else
                {
                    auth.me({ (name) -> Void in
                        self.mainDispatcher({ () -> Void in
                            self.performSegueWithIdentifier("loginToHome", sender: name)
                        })
                    })
                }
            })
        }
    }
    
    func mainDispatcher(block: ()->Void){
        NSOperationQueue.mainQueue().addOperationWithBlock({
            block()
        })
    }
    
}



