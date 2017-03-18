//
//  RoundButtonWithShadow.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/27/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

@IBDesignable
extension UIButton{
    
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = false
        }
    }
    @IBInspectable var borderWidth: CGFloat{
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor{
        get{
            return UIColor.black
        }
        set{
            layer.borderColor = newValue.cgColor
            
        }
    }
    
    @IBInspectable var shadowColor: UIColor{
        get{
            return UIColor.black
        }
        set{
            layer.shadowColor = newValue.cgColor
            
        }
    }
    
    @IBInspectable var offset: CGSize{
        get{
            return layer.shadowOffset
        }
        set{
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat{
        get{
            return layer.shadowRadius
        }
        set{
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        get{
                return layer.shadowOpacity
        }
        set{
            layer.shadowOpacity = newValue
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
