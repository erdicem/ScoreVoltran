//
//  GameViewController.swift
//  grup-projesi
//
//  Created by erdicem on 13.11.2022.
//

import UIKit

class GameViewController: UIViewController {

    
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var timer = Timer()
    
    var counter = 4
    var score = 0
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        userName.text = UserDefaults.standard.string(forKey: UserDefaultKeys.userName.rawValue)
        
         let totalScore = UserDefaults.standard.object(forKey: "highScore")
        highScore = totalScore as! Int
        self.highScoreLabel.text = "High Score: \(totalScore!)"
        
        self.timeLeftLabel.text = "Time Left : \(counter)"
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        self.score += 1
        self.startButton.setTitle("Score:  \(String(self.score))", for: .normal)
    }
    
    @objc func timerFunction(){
        self.timeLeftLabel.text = "Time: \(counter)"
            counter -= 1
            
            if counter == -1 {
                timer.invalidate()
                self.timeLeftLabel.text = "Time's Over."
                makeAlert(titleInput: "Time's Up", messageInput: "Do you want to play again?")
                startButton.isEnabled = false
                
                // Controlling High Score
                if self.score > self.highScore{
                                self.highScore = self.score
                                highScoreLabel.text = "High Score : \(highScore)"
                    // Saving Local Memory
                    UserDefaults.standard.set(self.highScore, forKey: "highScore")
                            }
            }
        }
    
    func makeAlert(titleInput: String, messageInput:String)  {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }

}
