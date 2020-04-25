//
//  IceCream.swift
//  2048 Ice Cream
//
//  Created by Elise Farley on 2/19/20.
//  Copyright © 2020 Elise Farley. All rights reserved.
//

import Foundation
import UIKit

class IceCream
{
    var type = ""
    var value = 0
    var location: Int
    
    init(location: Int){
        self.location = location
        type = randomType()
        if type == "vanilla"{
            value = 1
        }
        else{
            value = 2
        }
    }
    
    init(location: Int, value: Int){
        self.location = location
        self.value = value
        if value == 2{
            type = "chocolate"
        }
        else if value == 3{
            type = "sprinkle"
        }
        else if value == 4{
            type = "mint"
        }
        else if value == 5{
            type = "blue"
        }
        else if value == 6{
            type = "sundae"
        }
        else{
            type = "rainbow"
        }
    }
    
    func randomType() -> String{
        let number = Int.random(in:1...2)
        if number == 1{
            return "vanilla"
        }
        else{
            return "chocolate"
        }
    }
}
