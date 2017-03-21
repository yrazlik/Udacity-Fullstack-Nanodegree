//
//  RandomColorTextFieldDelegate.swift
//  RandomColorDelegateApp
//
//  Created by Razlik, Yasin(AWF) on 21/03/17.
//  Copyright © 2017 Razlik, Yasin. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func randomFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: randomFloat(),
                       green: randomFloat(),
                       blue: randomFloat(),
                       alpha: 1.0)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = randomColor()
        return true
    }
}
