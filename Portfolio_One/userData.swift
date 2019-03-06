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
    
    init(id: Int, dob: String, gender: String){
        self.id = id
        self.dob = dob
        self.gender = gender
    }  
}
