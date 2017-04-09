//
//  ValidationFunctions.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 3/24/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import Foundation
import UIKit

class ValidationFunctions{
    
    //var message:String = "", title:String = ""
    
    
    func emailIsEmpty(email:String, controller:UIViewController)->Bool{
    
    if email.isEmpty == true{
        errorsMessages(error: 1, controller: controller)
        return true
    }
        return false
}

func passwordIsValid(textField:String, controller:UIViewController)->Bool{
// ((?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$&]).{8,})  use this one for password. It checks for the char listed and length between 8 and 16
// ^[0-9a-zA-Z\.\_]{2,}$  thi one is good for email
    let length: Int = textField.characters.count
    
    let RegEx = "((?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$&]).{8,})"
    let Test = NSPredicate(format: "SELF MATCHES %@", RegEx)
    //let flag = Test.evaluate(with: textField)
   
    if length < 7 || length > 17 || textField.isEmpty {
        errorsMessages(error: 2, controller: controller)
        return false
    }
    else if (!Test.evaluate(with: textField)){ //flag == false) {
        errorsMessages(error: 3, controller: controller)
        return false
    }
    
    return true
}

    //Ths function checks if two passwords match
    func passwordIsSame(textField1: String, textField2: String, controller:UIViewController)->Bool{
        let password1 = textField1
        let password2 = textField2
        
        if password1 != password2{
            errorsMessages(error: 4, controller: controller)
            return false
        }

        return true
}


func errorsMessages(error:Int, controller:UIViewController){
        var message:String = ""
        var title:String!
    switch(error){
    case 1: title="Email"
        message += "Please enter an UCF email"
    case 2: title = "Password"
    message = "Password is empty or to short. The length needs to be between 8 and 16 characters."
    case 3: title = "Password"
        message = "Password needs at least 1 Uppercase letter, at least 1 number and at least 1 special character (!@#$&)."
    case 4: title = "Password Match"
        message = " Passwords do not match."
    default:message = ""
    
    }
        showAlert(title: title ,msg: message , controller: controller)
   
}
    
    func showAlert(title: String, msg: String, controller: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
}
