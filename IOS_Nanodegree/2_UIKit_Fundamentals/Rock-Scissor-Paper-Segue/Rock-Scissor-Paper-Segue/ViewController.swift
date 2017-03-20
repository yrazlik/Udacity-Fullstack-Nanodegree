//
//  ViewController.swift
//  Rock-Scissor-Paper-Segue
//
//  Created by Razlik, Yasin(AWF) on 20/03/17.
//  Copyright © 2017 Razlik, Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameResultImage: UIImage? = nil
    var gameResultString: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClickListener(_ sender: UIButton) {
        
        let aiTurn = generateRandomResult()
        gameResultString = getGameResultString(playerTurn: sender.tag, aiTurn: aiTurn)
        
        switch sender.tag {
        case 0:
            presentNextViewControllerProgrammatically(gameResultString: gameResultString!)
            break
        case 1:
            performSegue(withIdentifier: "showGameResult", sender: self)
            break
        case 2:
            break
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! GameResultViewController
        nextViewController.gameResultString = gameResultString!
        nextViewController.gameResultImage = gameResultImage
    }
    
    func presentNextViewControllerProgrammatically(gameResultString: String) {
        let nextViewController: GameResultViewController = storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
        nextViewController.gameResultString = gameResultString
        nextViewController.gameResultImage = gameResultImage
        present(nextViewController, animated: true, completion: nil)
        
    }
    
    //0: paper, 1:rock, 2:scissors
    func generateRandomResult() -> Int {
        return Int(arc4random_uniform(3))
    }
    
    //0: paper, 1:rock, 2:scissors
    func getGameResultString(playerTurn: Int, aiTurn: Int) -> String {
        if(playerTurn == 0 && aiTurn == 0) {
            gameResultImage = #imageLiteral(resourceName: "itsATie")
            return "It's a tie (Paper-Paper)"
        } else if(playerTurn == 0 && aiTurn == 1) {
            gameResultImage = #imageLiteral(resourceName: "PaperCoversRock")
            return "You win! Paper beats rock!"
        } else if(playerTurn == 0 && aiTurn == 2) {
            gameResultImage = #imageLiteral(resourceName: "ScissorsCutPaper")
            return "You lose! Scissors beats paper!"
        } else if(playerTurn == 1 && aiTurn == 0) {
            gameResultImage = #imageLiteral(resourceName: "PaperCoversRock")
            return "You lose! Paper beats rock!"
        } else if(playerTurn == 1 && aiTurn == 1) {
            gameResultImage = #imageLiteral(resourceName: "itsATie")
            return "It's a tie (Rock-Rock)"
        } else if(playerTurn == 1 && aiTurn == 2) {
            gameResultImage = #imageLiteral(resourceName: "RockCrushesScissors")
            return "You lose! Rock beats scissors!"
        } else if(playerTurn == 2 && aiTurn == 0) {
            gameResultImage = #imageLiteral(resourceName: "ScissorsCutPaper")
            return "You win! Scissors beats paper!"
        } else if(playerTurn == 2 && aiTurn == 1) {
            gameResultImage = #imageLiteral(resourceName: "RockCrushesScissors")
            return "You lose! Rock beats scissors!"
        } else if(playerTurn == 2 && aiTurn == 2) {
            gameResultImage = #imageLiteral(resourceName: "itsATie")
            return "It's a tie (Scissors-Scissors)"
        }
        return "";
    }
}

