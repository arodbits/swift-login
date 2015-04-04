//
//  HomeController.swift
//  login
//
//  Created by Anthony Rodriguez on 4/2/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    
    var nameHolder: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.text = nameHolder
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
