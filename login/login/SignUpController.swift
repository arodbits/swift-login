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
    @IBOutlet weak var repeatPasswordInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var lastname: UITextField!
    
    
    @IBAction func cancelButtonPressed(sender: UIStoryboardSegue) {
        
        self.dismissViewControllerAnimated(true , completion: nil)
        
    }
    @IBAction func signUpPressed(sender: UIButton) {
       let register = Register()
        let data: NSDictionary = [
            "email": self.emailInput.text,
            "password" : self.passwordInput.text,
            "name" : self.nameInput.text,
            "lastname": self.lastname.text,
            "password_confirmation": self.repeatPasswordInput.text
            ]
        register.register(data)
    }
   
}
