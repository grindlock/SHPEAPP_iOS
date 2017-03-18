//
//  RoundCornersAndShadowForView.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 3/17/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

class RoundCornersAndShadowForView: UIView {
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        /*layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width:1.0, height: 2.0)*/
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
