// Playground - noun: a place where people can play

import Cocoa
import Foundation


class Person{
    
    var name: String
    
    init(name: String, lastname: String){
        self.name = name
    }
    
}

class Employee: Person{
    
    var lastname: String
    
    init(){
        self.lastname = "Rodriguez"
        super.init(name: "Anthony", lastname: self.lastname)
        
    }
    
}

let e = Employee()

let test: NSDictionary = ["email": "AnthonyRodriguez"]


