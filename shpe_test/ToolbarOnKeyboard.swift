//
//  ToolbarOnKeyboard.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte, Alex Litras, Piero Castillo,
//  on 3/22/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

extension  UIViewController : UITextFieldDelegate{

    /*func addtoolBar(textField: UITextField, flag: Bool){
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = false
        toolBar.tintColor = UIColor.lightGray
        let done = UIBarButtonItem(title:"Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(donePressed))
        let keyboard = UIBarButtonItem(title:"Keyboard", style: UIBarButtonItemStyle.plain, target: self, action: #selector(keyboardPressed))
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target:nil, action: nil)
        
        toolBar.setItems([keyboard, space, done], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        //textField.delegate = self
        textField.inputAccessoryView = toolBar
        
    }
    
    func donePressed(){
        view.endEditing(true)
        
    }
    
    func keyboardPressed(){
        
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */*/

}
