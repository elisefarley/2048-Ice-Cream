//
//  IceCream.swift
//  2048 Ice Cream
//
//  Created by Elise Farley on 2/19/20.
//  Copyright © 2020 Elise Farley. All rights reserved.
//

import Foundation

class IceCream
{
    var type = ""
    var value = 0
    var location: Int
    
    init(location: Int)
    {
        value = 2
        self.location = location
        type = randomType()
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
        if number == 2
        {
            return "chocolate"
        }
        return ""
    }
}
