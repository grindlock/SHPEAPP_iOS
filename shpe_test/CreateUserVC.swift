//
//  CreateUserVCViewController.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/19/17.
//  Copyright © 2017 Sergio Perez-Aponte, Carlos Fortoul. All rights reserved.
//

import UIKit

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
    var textFields = [UITextField]()
    let majorOptions = ["Civil Engineering","Mechanical Engineering","Computer Engineering", "Other"]
    let academicOptions = ["Freshman","Sophomore","Junior","Senior","Super Senior"]
    
    var picker:UIPickerView!
    var i:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [fName, lName, nID, major, acaStanding,email, phone, pass1, pass2 ]
        
        findIndexForTextField(textField: fName)
        toolBar(textField: textFields[i], flag: false)
        
        findIndexForTextField(textField: lName)
        toolBar(textField: textFields[i], flag: false)
        
        findIndexForTextField(textField: nID)
        toolBar(textField: textFields[i], flag: false)
        
        let majorPicker = UIPickerView()
        majorPicker.delegate = self
        majorPicker.tag = 1
        major.inputView = majorPicker
        
        picker = majorPicker
        findIndexForTextField(textField: major)
        toolBar(textField: textFields[i], flag: true)
        
        let academicPicker = UIPickerView()
        academicPicker.delegate = self
        academicPicker.tag = 2
        acaStanding.inputView = academicPicker
        findIndexForTextField(textField: acaStanding)
        toolBar(textField: textFields[i], flag: false)
        
        findIndexForTextField(textField: email)
        toolBar(textField: textFields[i], flag: false)
        
        findIndexForTextField(textField: phone)
        toolBar(textField: textFields[i], flag: false)
        
        findIndexForTextField(textField: pass1)
        toolBar(textField: textFields[i], flag: false)
        
        findIndexForTextField(textField: pass2)
        toolBar(textField: textFields[i], flag: false)
        i=0
        self.becomeFirstResponder()

    }
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
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

    func toolBar(textField: UITextField, flag: Bool){
        findIndexForTextField(textField: textField)
        let toolBar = UIToolbar()
        toolBar.barStyle = .blackOpaque
        toolBar.isTranslucent = false
        toolBar.tintColor = UIColor.gray
        //toolBar.backgroundColor = UIColor.gray
        
        let done = UIBarButtonItem(title:"Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(donePressed))
        let keyboard = UIBarButtonItem(title:" Keyboard ", style: UIBarButtonItemStyle.plain, target: self, action: #selector(keyboardPressed))
        let list = UIBarButtonItem(title: " Majors ", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pickerPressed))
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target:nil, action: nil)
        
        let prev = UIBarButtonItem(title:"< ", style: UIBarButtonItemStyle.plain, target:self, action: #selector(prevButton))
        let next = UIBarButtonItem(title:" > ", style: UIBarButtonItemStyle.plain, target:self, action: #selector(nextPressed))
        
        if(flag == true){
            toolBar.setItems([prev, next,keyboard,list, space, done], animated: false)
        }
        else if flag == false{
            toolBar.setItems([prev, next, space, done], animated: false)
        }
       
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
       
    }
    
    func donePressed(){
        view.endEditing(true)
    }
    func keyboardPressed() {
        major.text = nil
        major.resignFirstResponder()
        major.inputView = nil
        major.becomeFirstResponder()
    }
    
    func pickerPressed(){
        major.resignFirstResponder()
        major.inputView = picker
        major.becomeFirstResponder()
    }
    
    func prevButton(){
        if(i != 0 && i >= 1 ){
           textFields[i].resignFirstResponder()
           i = i-1
           textFields[i].becomeFirstResponder()
        }
        
    }
    func nextPressed(){
        if(i < textFields.count-1){
            textFields[i].resignFirstResponder()
            i = i+1
            textFields[i].becomeFirstResponder()
        }
    }
    
    func findIndexForTextField(textField: UITextField){
      
        i = textFields.index(of: textField)!
        
    }
    
    
}
