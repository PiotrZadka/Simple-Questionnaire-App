//
//  QuestionOne.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit

class QuestionOne: UIViewController {
    
    //recieving user Object
    var data: userData?

    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonYes(_ sender: Any) {
        self.performSegue(withIdentifier: "selectedYes", sender: self)
        //add YES to question 1
    }
    
    @IBAction func buttonNo(_ sender: Any) {
        self.performSegue(withIdentifier: "selectedNo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedYes" {
            let vc = segue.destination as! SecondQuestion
            //passing user Object forward
            vc.userDetails = data
        }
        else{
            let vc = segue.destination as! SecondQuestion_B
            //passing user Object forward
            vc.userDetails = data
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
