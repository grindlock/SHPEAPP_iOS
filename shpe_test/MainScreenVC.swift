//
//  MainScreenVC.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/19/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import SwiftKeychainWrapper

class MainScreenVC: UIViewController {
   
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x:0,y:0, width: 120, height: 30))
        label.font = email.font
        label.text = emailSuffix
        
        email.returnKeyType = .next
        email.delegate = self
        password.returnKeyType = .done
        password.delegate = self
        
        email.rightView = label
        email.rightViewMode = .always
        
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey:KEY_UID){
            
            performSegue(withIdentifier: "login", sender: "")
        }
    }

    @IBAction func pressedLogin(_ sender: Any) {
        let em = email.text!
        let pass = password.text!
        
        if ValidationFunctions().emailIsEmpty(email: em, controller: self){
            email.borderWidth = 2
            email.cornerRadius = 5
            email.borderColor = UIColor.red
            
            
        }
        if !ValidationFunctions().passwordIsValid(textField: pass, controller: self){
            password.borderWidth = 2
            password.cornerRadius = 5
            password.borderColor = UIColor.red

        }
            
        else{
            login(email: em+emailSuffix, password: pass)
        }
        
        
        
        
        //login to the server
        
        //if state
      
            
            //performSegue(withIdentifier: "login", sender: "")
        
    }
    
    func login(email: String, password: String){
        FIRAuth.auth()?.signIn(withEmail: email , password: password, completion: {(user, error) in
            //Authetication with Firebase was not sucessful show an alert using the error from firebase
            if error != nil {
                //print error to the console
                print("LOGIN: \(String(describing: error))")
                //grab the error code (enum type)
                if let errCode = FIRAuthErrorCode(rawValue: (error?._code)!){
                    var title:String!
                    var message:String!
                    
                    switch(errCode){
                    case .errorCodeUserNotFound:
                        title = "Sign In Error"
                        message = "The email provided: \(email) does not exist."
                        break
                    default:
                         title = "Sign In Error"
                         message = "Something went terribly wrong. Please try again."
                        break
                        
                    }
                    if !title.isEmpty {
                        ValidationFunctions().showAlert(title: title,msg: message, controller: self)
                    }
                    
                }
            }
                
                
                
            else{
                print("LOGIN: Login was sucessful")
                if let user = user {
                    KeychainWrapper.standard.set(user.uid, forKey: KEY_UID)
                    self.performSegue(withIdentifier: "login", sender: nil)
                }
                
            }
        })
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

