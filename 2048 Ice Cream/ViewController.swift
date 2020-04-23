//
//  ViewController.swift
//  2048 Ice Cream
//
//  Created by Elise Farley on 2/19/20.
//  Copyright © 2020 Elise Farley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var location0: UIImageView!
    @IBOutlet weak var location1: UIImageView!
    @IBOutlet weak var location2: UIImageView!
    @IBOutlet weak var location3: UIImageView!
    @IBOutlet weak var location4: UIImageView!
    @IBOutlet weak var location5: UIImageView!
    @IBOutlet weak var location6: UIImageView!
    @IBOutlet weak var location7: UIImageView!
    @IBOutlet weak var location8: UIImageView!
    @IBOutlet weak var location9: UIImageView!
    @IBOutlet weak var location10: UIImageView!
    @IBOutlet weak var location11: UIImageView!
    @IBOutlet weak var location12: UIImageView!
    @IBOutlet weak var location13: UIImageView!
    @IBOutlet weak var location14: UIImageView!
    @IBOutlet weak var location15: UIImageView!
    var locationsArray = [UIImageView]()
    var iceCreamArray = [IceCream]()
    var gameOver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationsArray.append(location0)
        locationsArray.append(location1)
        locationsArray.append(location2)
        locationsArray.append(location3)
        locationsArray.append(location4)
        locationsArray.append(location5)
        locationsArray.append(location6)
        locationsArray.append(location7)
        locationsArray.append(location8)
        locationsArray.append(location9)
        locationsArray.append(location10)
        locationsArray.append(location11)
        locationsArray.append(location12)
        locationsArray.append(location13)
        locationsArray.append(location14)
        locationsArray.append(location15)
        for location in locationsArray
        {
            location.image = UIImage(named: "basic")
        }
    }
    
    func randomLocation() -> Int{
        var availableLocations = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        if iceCreamArray.count != 0
        {
            for iceCream in iceCreamArray
            {
                let location = iceCream.location
                for num in availableLocations
                {
                    if location == num
                    {
                        let index = availableLocations.firstIndex(of: num)!
                        availableLocations.remove(at: index)
                    }
                }
            }
        }
        if availableLocations.count == 0
        {
            print("out of moves")
            gameOver = true
        }
        return availableLocations.randomElement()!
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        let newIceCream = IceCream(location: randomLocation())
        locationsArray[newIceCream.location].image = UIImage(named: "\(newIceCream.type)")
        iceCreamArray.append(newIceCream)
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        let newIceCream = IceCream(location: randomLocation())
        locationsArray[newIceCream.location].image = UIImage(named: "\(newIceCream.type)")
        iceCreamArray.append(newIceCream)
    }
    
    @IBAction func swipeUp(_ sender: Any) {
        let newIceCream = IceCream(location: randomLocation())
        locationsArray[newIceCream.location].image = UIImage(named: "\(newIceCream.type)")
        iceCreamArray.append(newIceCream)
    }
    
    @IBAction func swipeDown(_ sender: Any) {
        let newIceCream = IceCream(location: randomLocation())
        locationsArray[newIceCream.location].image = UIImage(named: "\(newIceCream.type)")
        iceCreamArray.append(newIceCream)
    }
}

