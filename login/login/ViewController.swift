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
        
        let url = "https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA"
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        let session = NSURLSession.sharedSession()
        let downloadTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            let strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            var err: NSError?
            let json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as NSDictionary?
            
//            println(json!)
            
            if(err != nil){
                //println(err!.localizedDescription)
            }
            else {
//                we still need to check wheather the json variable has a value using the 
//                optional binding
                if let parseJSON = json {
                    println(parseJSON["results"]["address_components"])
                }
            
            }
            
        })
        downloadTask.resume()
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

