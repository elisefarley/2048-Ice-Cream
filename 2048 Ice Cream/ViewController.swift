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
    }
    
    @IBAction func swipeRight(_ sender: Any) {
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
    }
    
    @IBAction func swipeUp(_ sender: Any) {
    }
    
    @IBAction func swipeDown(_ sender: Any) {
    }
}

