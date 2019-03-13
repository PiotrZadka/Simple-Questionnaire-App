//
//  FinalView.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit

class FinalView: UIViewController {
    var userDetails: userData?
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        userDetails?.question3 = "YES"
        self.performSegue(withIdentifier: "goToThankYou", sender: self)
    }
    
    @IBAction func noClicked(_ sender: Any) {
        userDetails?.question3 = "NO"
        self.performSegue(withIdentifier: "goToThankYou", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToThankYou" {
            //add userObject with answers to CoreData
            let vc = segue.destination as! ThankYouView
            vc.userDetails = userDetails
        }
    }
    
}


