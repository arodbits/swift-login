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
    
   
    
    @IBAction func cancelButtonPressed(sender: UIStoryboardSegue) {
        
        self.dismissViewControllerAnimated(true , completion: nil)
        
    }
    @IBAction func signUpPressed(sender: UIButton) {
       let register = Register()
        let data: NSDictionary = ["email": self.emailInput.text, "password" : self.passwordInput.text]
        register.register(data)
    }
   
}
