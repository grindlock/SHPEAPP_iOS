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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.returnKeyType = .next
        email.delegate = self
        password.returnKeyType = .done
        password.delegate = self
        
    }
    
    

    @IBAction func pressedLogin(_ sender: Any) {
        
        //func call to check email validity
        //func call to check password meets the required meet
        
        //login to the server
        
        //if state
        performSegue(withIdentifier: "login", sender: "")
        
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

