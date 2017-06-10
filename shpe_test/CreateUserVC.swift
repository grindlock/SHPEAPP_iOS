//
//  CreateUserVCViewController.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/19/17.
//  Copyright © 2017 Sergio Perez-Aponte, Carlos Fortoul, SHPE UCF. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class CreateUserVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    
    
    @IBOutlet weak var major:UITextField!
    @IBOutlet weak var acaStanding:UITextField!
    @IBOutlet weak var fName:UITextField!
    @IBOutlet weak var lName:UITextField!
    @IBOutlet weak var nID:UITextField!
    @IBOutlet weak var email:UITextField!
    @IBOutlet weak var phone:UITextField!
    @IBOutlet weak var pass1:UITextField!
    @IBOutlet weak var pass2:UITextField!
    
    var activeField: UITextField!
    
    let majorOptions = ["Civil Engineering","Mechanical Engineering","Computer Engineering", "Other"]
    
    let academicOptions = ["Freshman","Sophomore","Junior","Senior","Super Senior"]
    
    var picker:UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let majorPicker = UIPickerView()
        majorPicker.delegate = self
        majorPicker.tag = 1
        major.inputView = majorPicker
        
        picker = majorPicker
        
        let academicPicker = UIPickerView()
        academicPicker.delegate = self
        academicPicker.tag = 2
        acaStanding.inputView = academicPicker
       
        self.becomeFirstResponder()

    }
    
    
    //capture the textfield that has been touch and saves a reference. Also add the toolbar to the textfield
    func textFieldDidBeginEditing(_ textField: UITextField) -> Bool {
        toolBar(textField: textField)
        activeField = textField
        
        return true
    }
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerPressed(_ sender: AnyObject){
        
        if !ValidationFunctions().passwordIsValid(textField: pass1.text!, controller: self) && !ValidationFunctions().passwordIsValid(textField: pass2.text!, controller: self){
            pass1.borderWidth = 2
            pass1.cornerRadius = 5
            pass1.borderColor = UIColor.red
            
            pass2.borderWidth = 2
            pass2.cornerRadius = 5
            pass2.borderColor = UIColor.red
            
            if !ValidationFunctions().passwordIsSame(textField1: pass1.text!, textField2: pass2.text!, controller: self){
                pass1.borderWidth = 2
                pass1.cornerRadius = 5
                pass1.borderColor = UIColor.red
                
                pass2.borderWidth = 2
                pass2.cornerRadius = 5
                pass2.borderColor = UIColor.red
            }
            
        }
        
        if ValidationFunctions().emailIsEmpty(email: email.text! , controller: self){
            email.borderWidth = 2
            email.cornerRadius = 5
            email.borderColor = UIColor.red
        }
            
        
        else{
            FIRAuth.auth()?.createUser(withEmail: email.text!+emailSuffix, password: pass1.text!, completion: { (user, error) in
                if error == nil{
                    if let user = user {
                        KeychainWrapper.standard.set(user.uid, forKey: KEY_UID)

                        let userData = ["Fname": self.fName.text!, "Lname":self.lName.text!, "shpeNID": self.nID.text!, "academic-level":"", "major":self.major.text!,"academic-standing":self.acaStanding.text!, "email":user.email!, "phone":self.phone.text!]
                       
                        DataService.ds.createFirebaseDBUser(uid: user.uid, userData: userData)
                        
                        self.performSegue(withIdentifier: "register", sender: nil)
                    }
                }
                else{
                    print("REGISTER: \(String(describing: error))")
                }
            })
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return majorOptions.count
        }else if pickerView.tag == 2{
            return academicOptions.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return majorOptions[row]
        }else if pickerView.tag == 2{
            return academicOptions[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            let text = majorOptions[row]
            /*if row == 3{
                major.resignFirstResponder()
                major.inputView = nil
                major.becomeFirstResponder()
                major.inputView = pickerView
                
            }else{*/
                return major.text = text
            //}
        }else if pickerView.tag == 2{
            return acaStanding.text = academicOptions[row]
        }
    }

    func toolBar(textField: UITextField ){
        print("THE TAG TOOLBAR FUNC\(textField.tag)")
        let toolbar =  UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor.gray
        
        let prev = UIBarButtonItem(title: "< ", style: UIBarButtonItemStyle.plain, target: self, action: #selector(previousTextField))
        
        let next = UIBarButtonItem(title: " >", style: UIBarButtonItemStyle.plain, target: self, action: #selector(nextTextField))
        
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target:nil, action: nil)
        
         let done = UIBarButtonItem(title:"Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(donePressed))
        
        toolbar.setItems([prev, next, space, done], animated: false)
        
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolbar
        
        
        
    }
    
    func previousTextField(){
        //check if it is a valid tag
        if activeField.tag > 0 {
          //assigns the previous textfield to prevField from the textfield that is active
            if let prevField = self.view.viewWithTag(activeField.tag - 1) as? UITextField {
                prevField.becomeFirstResponder()
            }}
    }
    
    func nextTextField(){
        //check if it is a valid tag
        if activeField.tag < 9{
            //assigns the next textfield to nextField from the textfield that is active
            if let nextField = self.view.viewWithTag(activeField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder()
            }
        }
    }
    
    func donePressed(){
        view.endEditing(true)
    }
}
