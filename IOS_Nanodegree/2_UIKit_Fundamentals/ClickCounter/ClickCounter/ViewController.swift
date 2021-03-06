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
    var decrementButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        addIncrementButton()
        addDecrementButton()
    }
    
    func addLabel() {
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        self.view.addSubview(label)
        self.label = label
    }
    
    func addIncrementButton() {
        let button = UIButton()
        button.frame = CGRect(x:150, y: 250, width: 90, height: 90)
        button.setTitle("Increment", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(ViewController.incrementButtonClickListener), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        self.button = button
    }
    
    func addDecrementButton() {
        let button = UIButton()
        button.frame = CGRect(x:150, y: 350, width: 90, height: 90)
        button.setTitle("Decrement", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(ViewController.decrementButtonClickListener), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        self.button = button
    }
    
    func incrementButtonClickListener() {
        incrementCount()
        updateLabelText(count: count)
    }

    func decrementButtonClickListener() {
        decrementCount()
        updateLabelText(count: count)
    }

    
    func incrementCount() {
        self.count += 1
    }

    
    func decrementCount() {
        self.count -= 1
    }

    func updateLabelText(count: Int) -> Void {
        self.label.text = String(count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

