//
//  ViewController.swift
//  ClickCounter
//
//  Created by Razlik, Yasin(AWF) on 08/03/17.
//  Copyright © 2017 Razlik, Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    var label: UILabel!
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        addButton()
    }
    
    func addLabel() {
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        self.view.addSubview(label)
        self.label = label
    }
    
    func addButton() {
        let button = UIButton()
        button.frame = CGRect(x:150, y: 250, width: 60, height: 60)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(ViewController.buttonClickListener), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        self.button = button
    }
    
    func buttonClickListener() {
        incrementCount()
        updateLabelText(count: count)
    }
    
    func incrementCount() {
        self.count += 1
    }
    
    func updateLabelText(count: Int) -> Void {
        self.label.text = String(count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

