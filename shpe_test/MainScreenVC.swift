//
//  MainScreenVC.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/19/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pressedLogin(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: "")
        
    }
    
    

    
    
    


}

