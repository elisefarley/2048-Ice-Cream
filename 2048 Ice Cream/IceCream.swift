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
    
    init(location: Int)
    {
        self.location = location
        type = randomType()
        if type == "vanilla"
        {
            value = 1
        }
        else
        {
            value = 2
        }
    }
    
    func isEmpty() -> Bool
    {
        return value == 0
    }
    
    func randomType() -> String
    {
        let number = Int.random(in:1...2)
        if number == 1
        {
            return "vanilla"
        }
        else
        {
            return "chocolate"
        }
    }
}
