//
//  ViewController.swift
//  login
//
//  Created by Anthony Rodriguez on 3/27/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//


import UIkit
import Foundation


class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
//  Client id and secret (Application credentials)
    let client_id = "QldBvenYfVoOqGCT"
    let client_secret = "rlLlSVoUBGJ37NM61zOuK1mvRBwKstmg"
    let api_url = "http://homestead.app/oauth/access_token"
    var access_token: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignInPressed(sender: AnyObject) {
       
        let url = NSURL(string: api_url)
        let request = NSMutableURLRequest(URL: url!);
        request.HTTPMethod = "POST"
        let credentials: NSString = NSString(string: "grant_type=password&username=\(email.text)&password=\(password.text)&client_id=\(client_id)&client_secret=\(client_secret)")
        let credentialsData: NSData = credentials.dataUsingEncoding(NSUTF8StringEncoding)!
        request.HTTPBody = credentialsData
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            var error: NSError?
            
            let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as? NSDictionary
            let result = NSString(data: data, encoding: NSUTF8StringEncoding)
            println(result)
        }
        
        task.resume()
        
        
        
        
        
        
        
        
        
        
        
        
        
//        let request = NSMutableURLRequest(URL: nsUrl!)
//        let credentials = NSString(string: "AnthonyRodriguez.itt@gmail.com:123456")
//        let loginData: NSData = credentials.dataUsingEncoding(NSUTF8StringEncoding)!
//        let loginData64 = loginData.base64EncodedDataWithOptions(nil)
//        request.HTTPMethod = "POST"
//        request.setValue("Basic \(loginData64)", forHTTPHeaderField: "Authorization")
//        let session = NSURLSession.sharedSession()
//        let downloadTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
//            println(response)
//            
//        })
//        downloadTask.resume()
        
        
    }

}

