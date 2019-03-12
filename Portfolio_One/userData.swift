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
    
    init(id: Int, dob: String, gender: String){
        self.id = id
        self.dob = dob
        self.gender = gender
        self.question1 = "not-selected"
        self.question2A = "not-selected"
        self.question2B = "not-selected"
        self.question3 = "not-selected"
    }  
}
