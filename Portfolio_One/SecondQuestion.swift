//
//  SecondQuestion.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit

class SecondQuestion: UIViewController {

    //recieving user Object
    var userDetails: userData?
    
    //image views
    @IBOutlet weak var imgWork: UIImageView!
    @IBOutlet weak var imgGames: UIImageView!
    @IBOutlet weak var imgInternet: UIImageView!
    @IBOutlet weak var imgSocial: UIImageView!
    @IBOutlet weak var imgOther: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgWork.isUserInteractionEnabled = true
        imgGames.isUserInteractionEnabled = true
        imgInternet.isUserInteractionEnabled = true
        imgSocial.isUserInteractionEnabled = true
        imgOther.isUserInteractionEnabled = true
        
        // TapGesture can only be attached to one element.
        // Reusing same gesture for multiple elements causes only the last one to work
        let TapGestureWork = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTapped))
        let TapGestureGames = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTapped))
        let TapGestureInternet = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTapped))
        let TapGestureSocial = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTapped))
        let TapGestureOther = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTapped))
        
        self.imgWork.addGestureRecognizer(TapGestureWork)
        self.imgGames.addGestureRecognizer(TapGestureGames)
        self.imgInternet.addGestureRecognizer(TapGestureInternet)
        self.imgSocial.addGestureRecognizer(TapGestureSocial)
        self.imgOther.addGestureRecognizer(TapGestureOther)
    
    }
    
    @objc func imageTapped(){
        self.performSegue(withIdentifier: "goToFinalQuestion", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFinalQuestion" {
            // add "choice" to question 2A
            let vc = segue.destination as! FinalView
            //passing user Object forward
            vc.userDetails = userDetails
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
