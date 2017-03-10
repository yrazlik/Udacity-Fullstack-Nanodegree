//
//  ViewController.swift
//  ImagePickerExperiment
//
//  Created by Razlik, Yasin(AWF) on 09/03/17.
//  Copyright © 2017 Razlik, Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showImagePickerButton: UIButton!
    @IBOutlet weak var showActivityViewController: UIButton!
    @IBOutlet weak var showAlertViewCotrollerButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClickListener(_ sender: UIButton) {
        switch sender {
        case showImagePickerButton:
            let nextViewController = UIImagePickerController()
            self.present(nextViewController, animated: true, completion: nil)
            break
        case showActivityViewController:
            let image = UIImage()
            let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.present(controller, animated: true, completion: nil)
            break
        case showAlertViewCotrollerButton:
            let controller = UIAlertController()
            controller.message = "This is an alert"
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                action in self.dismiss(animated: true, completion: nil)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) {
                action in self.dismiss(animated: true, completion: nil)
            }
            controller.addAction(okAction)
            controller.addAction(cancelAction)
            self.present(controller, animated: true, completion: nil)
            break
        default:
            break
        }
    }
}

