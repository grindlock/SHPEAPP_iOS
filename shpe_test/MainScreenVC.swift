//
//  MainScreenVC.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/19/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController {
   
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var emailLbl: UILabel!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x:0,y:0, width: 120, height: 30))
        label.font = email.font
        label.text = "@knights.ucf.edu"
        
        email.returnKeyType = .next
        email.delegate = self
        password.returnKeyType = .done
        password.delegate = self
        
        email.rightView = label
        email.rightViewMode = .always
        
        
        
    }
    
    

    @IBAction func pressedLogin(_ sender: Any) {
        
        if ValidationFunctions().emailIsEmpty(email: email.text!, controller: self){
            email.borderWidth = 2
            email.cornerRadius = 5
            email.borderColor = UIColor.red
            
            
        }
        if !ValidationFunctions().passwordIsValid(textField: password.text!, controller: self){
            password.borderWidth = 2
            password.cornerRadius = 5
            password.borderColor = UIColor.red

        }
            
        else{

            performSegue(withIdentifier: "login", sender: "")
        }
        
        
        //func call to check email validity
        //func call to check password meets the required meet
        
        //login to the server
        
        //if state
      
            
            //performSegue(withIdentifier: "login", sender: "")
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == email {
            email.resignFirstResponder()
            password.becomeFirstResponder()
        }
        else if textField == password {
            password.endEditing(true)
        }
        
        return true
    }

}

