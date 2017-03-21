//
//  CreateUserVCViewController.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/19/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

class CreateUserVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var major:UITextField!
    @IBOutlet weak var acaStanding:UITextField!
    let majorOptions = ["Civil Engineering","Mechanical Engineering","Computer Engineering", "Other"]
    let academicOptions = ["Freshman","Sophomore","Junior","Senior","Super Senior"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let majorPicker = UIPickerView()
        majorPicker.delegate = self
        majorPicker.tag = 1
        major.inputView = majorPicker
        
        let academicPicker = UIPickerView()
        academicPicker.delegate = self
        academicPicker.tag = 2
        acaStanding.inputView = academicPicker
        
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
            if row == 3{
                major.resignFirstResponder()
                major.inputView = nil
                major.becomeFirstResponder()
                
            }else{
                return major.text = text
            }
        }else if pickerView.tag == 2{
            return acaStanding.text = academicOptions[row]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func changePickertoKeyboard(){
        major.becomeFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
