//
//  ViewController.swift
//  RandomColorDelegateApp
//
//  Created by Razlik, Yasin(AWF) on 21/03/17.
//  Copyright © 2017 Razlik, Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var randomColorTextField: UITextField!
    
    let randomColorTextFieldDelegate: RandomColorTextFieldDelegate =  RandomColorTextFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        randomColorTextField.delegate = randomColorTextFieldDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

