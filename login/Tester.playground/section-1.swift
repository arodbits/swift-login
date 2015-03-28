// Playground - noun: a place where people can play

import Cocoa
import Foundation
var str = "Hello, playground"



let url = "https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA"

let requestURL = NSURL(string: url)

let sharedSession = NSURLSession.sharedSession()
let downloadTask = sharedSession.downloadTaskWithURL(requestURL!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
    println(response)
})
downloadTask.resume()

