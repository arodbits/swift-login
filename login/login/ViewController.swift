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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignInPressed(sender: AnyObject) {
       
        let url = "http://homestead.app/home"
        let nsUrl = NSURL(string: url)
        let request = NSMutableURLRequest(URL: nsUrl!)
        let credentials = NSString(string: "AnthonyRodriguez.itt@gmail.com:123456")
        let loginData: NSData = credentials.dataUsingEncoding(NSUTF8StringEncoding)!
        let loginData64 = loginData.base64EncodedDataWithOptions(nil)
        request.HTTPMethod = "POST"
        request.setValue("Basic \(loginData64)", forHTTPHeaderField: "Authorization")
        let session = NSURLSession.sharedSession()
        let downloadTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            println(response)
            
        })
        downloadTask.resume()
        
        
    }

}

