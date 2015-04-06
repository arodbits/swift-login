//
//  SignUpController.swift
//  login
//
//  Created by Anthony Rodriguez on 4/4/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

import Foundation
import UIKit

class SignUpController: UIViewController {
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    var api = ApiHandler()
    
    @IBAction func cancelButtonPressed(sender: UIStoryboardSegue) {
        
        self.dismissViewControllerAnimated(true , completion: nil)
        
    }
    @IBAction func signUpPressed(sender: UIButton) {
        api.register(emailInput.text, password: passwordInput.text)
    }
   
}
