//
//  ThankYouView.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit

class ThankYouView: UIViewController {
    var userDetails: userData?
    
    @IBOutlet weak var backToStart: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "backToBeginning", sender: Any?.self)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "showResults2", sender: Any?.self) {
            self.performSegue(withIdentifier: "showResults2", sender: Any?.self)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showResults2" {
            if passwordField.text == "password" {
                return true
            }
            else
            {
                errorLabel.text = "Incorrect password"
                return false
            }
        }
        else
        {
            return false
        }
    }
    
    


}
