//
//  Flag.swift
//  FlagsOfTheWorldRevisedApp
//
//  Created by adil gupta on 17/04/20.
//  Copyright © 2020 priyam. All rights reserved.
//

import Foundation
class Flag {
    var flag : String
    var country: String
    var region: String
    var population: String
    
    init( flag : String, country: String, region: String, population: String) {
        self.flag = flag
        self.country = country
        self.region = region
        self.population = population
    }
}
