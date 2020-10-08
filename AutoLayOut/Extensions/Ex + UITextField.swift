//
//  Ex + UITextField.swift
//  AutoLayOut
//
//  Created by Pawan  on 06/10/2020.
//

import UIKit
extension UITextField {
    
    func BottomBorder(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity  = 1.0
        self.layer.shadowRadius =   0.0
    }
}
