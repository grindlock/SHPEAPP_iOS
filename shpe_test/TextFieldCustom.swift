//
//  TextFieldCustom.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/27/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
extension UITextField {

        
        @IBInspectable var cornerRadius: CGFloat{
            get{
                return layer.cornerRadius
            }
            set{
                layer.cornerRadius = newValue
            }
        }
    @IBInspectable var masksToBounds:Bool{
        get{
            return false
        }
        set{
            layer.masksToBounds = newValue
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

}
