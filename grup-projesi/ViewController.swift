//
//  ViewController.swift
//  grup-projesi
//
//  Created by Mustafa Çiçek on 13.11.2022.
//

import UIKit

enum UserDefaultKeys:String{
    case userName, highScore
}

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var saveNameButton: UIButton!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
    }
    
    
    @IBAction func saveName(_ sender: Any) {
        if nameTextField.text?.count ?? 0 > 2 {
           
            // pass navigation
            // userDefault
            
           

            UserDefaults.standard.set(self.nameTextField.text, forKey: UserDefaultKeys.userName.rawValue)
            
            UserDefaults.standard.object(forKey: UserDefaultKeys.userName.rawValue)
            
            performSegue(withIdentifier: "toGame", sender: self)
        }
        else {
            makeAlert(titleInput: "Warning", messageInput: "User invalid")
        }
    }
    
    func makeAlert(titleInput: String, messageInput:String)  {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }


}

