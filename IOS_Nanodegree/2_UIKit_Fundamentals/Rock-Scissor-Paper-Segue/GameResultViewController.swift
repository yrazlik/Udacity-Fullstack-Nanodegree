//
//  GameResultViewController.swift
//  Rock-Scissor-Paper-Segue
//
//  Created by Razlik, Yasin(AWF) on 20/03/17.
//  Copyright © 2017 Razlik, Yasin. All rights reserved.
//

import UIKit

class GameResultViewController: UIViewController {
    
    var gameResultString: String = ""
    var gameResultImage: UIImage? = nil
    
    @IBOutlet weak var gameResultLabel: UILabel!
    @IBOutlet weak var gameResultImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        gameResultLabel.text = gameResultString;
        
        if(gameResultImage != nil) {
            gameResultImageView.image = gameResultImage
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgainButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
