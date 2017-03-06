//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Razlik, Yasin(AWF) on 06/03/17.
//  Copyright © 2017 Razlik, Yasin. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundsViewController loaded. The recordedAudioURL is " + recordedAudioURL.absoluteString)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
