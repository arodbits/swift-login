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

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://httpbin.org/user-agent"
        
        let requestURL = NSURL(string: url)
        
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask = sharedSession.downloadTaskWithURL(requestURL!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            var urlContent = NSString(contentsOfURL: requestURL!, encoding: NSUTF8StringEncoding, error: nil)
            
            println(urlContent)
        })
        downloadTask.resume()
        

        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        
        
    
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

