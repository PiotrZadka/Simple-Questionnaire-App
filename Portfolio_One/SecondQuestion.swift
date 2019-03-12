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
    
    @IBOutlet weak var imgGames: UIImageView!
    @IBOutlet weak var imgInternet: UIImageView!
    @IBOutlet weak var imgSocial: UIImageView!
    @IBOutlet weak var imgOther: UIImageView!
    @IBOutlet weak var imgWork: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgWork.isUserInteractionEnabled = true
        imgGames.isUserInteractionEnabled = true
        imgInternet.isUserInteractionEnabled = true
        imgSocial.isUserInteractionEnabled = true
        imgOther.isUserInteractionEnabled = true
        
        // TapGesture can only be attached to one element.
        // Reusing same gesture for multiple elements causes only the last one to work
        
        let TapGestureWork = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTappedWork))
        let TapGestureGames = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTappedGames))
        let TapGestureInternet = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTappedInternet))
        let TapGestureSocial = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTappedSocial))
        let TapGestureOther = UITapGestureRecognizer(target: self, action: #selector(SecondQuestion.imageTappedOther))
        
        self.imgWork.addGestureRecognizer(TapGestureWork)
        self.imgGames.addGestureRecognizer(TapGestureGames)
        self.imgInternet.addGestureRecognizer(TapGestureInternet)
        self.imgSocial.addGestureRecognizer(TapGestureSocial)
        self.imgOther.addGestureRecognizer(TapGestureOther)
    
    }
    
    
    //Unsure how I can pass custom parameter in #selector or set a name/title to image so I can easier pass "label" and just use one function.
    
    @objc func imageTappedWork(){
        userDetails?.question2A = "Work"
        self.performSegue(withIdentifier: "goToFinalQuestion", sender: self)
    }
    
    @objc func imageTappedGames(){
        userDetails?.question2A = "Games"
        self.performSegue(withIdentifier: "goToFinalQuestion", sender: self)
    }
    
    @objc func imageTappedInternet(){
        userDetails?.question2A = "Internet"
        self.performSegue(withIdentifier: "goToFinalQuestion", sender: self)
    }
    
    @objc func imageTappedSocial(){
        userDetails?.question2A = "Social Network"
        self.performSegue(withIdentifier: "goToFinalQuestion", sender: self)
    }
    
    @objc func imageTappedOther(){
        userDetails?.question2A = "Other"
        self.performSegue(withIdentifier: "goToFinalQuestion", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFinalQuestion" {
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
