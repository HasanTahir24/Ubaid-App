//
//  Roundimage.swift
//  News_Feed
//
//  Created by clines329 on 10/19/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit
@IBDesignable
class Roundimage: UIImageView {
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
        
    }
    
    @IBInspectable var borderWidth:CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
            
        }
        
    }
    
    @IBInspectable var borderColor:UIColor = .white {
        didSet{
            layer.borderColor = borderColor.cgColor
            
        }
        
    }

}
