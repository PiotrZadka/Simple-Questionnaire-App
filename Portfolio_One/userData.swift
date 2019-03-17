//
//  userData.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import Foundation

struct userData{
    var id: Int
    var dob: String
    var gender: String
    var question1: String
    var question2A: String
    var question2B: String
    var question3: String
    var latitude: String
    var longitude: String
    
    init(id: Int, dob: String, gender: String){
        self.id = id
        self.dob = dob
        self.gender = gender
        self.question1 = "N/A"
        self.question2A = "N/A"
        self.question2B = "N/A"
        self.question3 = "N/A"
        self.longitude = "N/A"
        self.latitude = "N/A"
    }  
}
