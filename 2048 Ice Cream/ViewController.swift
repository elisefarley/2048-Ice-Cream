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
    var youWin = false
    var scoreNum = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreNum = 0
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
        play()
        play()
    }
    
    func randomLocation() -> Int{
        var availableLocations = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        if iceCreamArray.count != 0{
            for iceCream in iceCreamArray{
                let location = iceCream.location
                for num in availableLocations{
                    if location == num{
                        let index = availableLocations.firstIndex(of: num)!
                        availableLocations.remove(at: index)
                    }
                }
            }
        }
        if availableLocations.count == 0{
            gameOver = true
            return -1
        }
        return availableLocations.randomElement()!
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        var row0 = [3]
        var row1 = [7]
        var row2 = [11]
        var row3 = [15]
        var allRows = [[Int]]()
        
        for iceCream in iceCreamArray{
            if iceCream.location == 0 || iceCream.location == 1 || iceCream.location == 2 || iceCream.location == 3{
                row0.append(iceCream.location)
            }
            else if iceCream.location == 4 || iceCream.location == 5 || iceCream.location == 6 || iceCream.location == 7{
                row1.append(iceCream.location)
            }
            else if iceCream.location == 8 || iceCream.location == 9 || iceCream.location == 10 || iceCream.location == 11{
                row2.append(iceCream.location)
            }
            else if iceCream.location == 12 || iceCream.location == 13 || iceCream.location == 14 || iceCream.location == 15{
                row3.append(iceCream.location)
            }
            row0.sort()
            row1.sort()
            row2.sort()
            row3.sort()
            allRows = [row0, row1, row2, row3]
        }
        for row in allRows{
            if row.count == 2{
                var index = 0
                var testIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[0]{
                        index = testIndex
                    }
                    testIndex += 1
                }
                iceCreamArray[index].location = row[1]
            }
            if row.count == 3{
                var stop = false
                var firstIndex = 0
                var secondIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[0]{
                        secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[1]{
                                if iceCream.value == secondIceCream.value{
                                    iceCreamArray.remove(at: firstIndex)
                                    if firstIndex < secondIndex{
                                        secondIndex -= 1
                                    }
                                    iceCreamArray.remove(at: secondIndex)
                                    let newIceCream = IceCream(location: row[2], value: iceCream.value + 1)
                                    iceCreamArray.append(newIceCream)
                                    stop = true
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
                if !stop{
                    firstIndex = 0
                    secondIndex = 0
                    var firstIndexTest = 0
                    var secondIndexTest = 0
                    for iceCream in iceCreamArray{
                        if iceCream.location == row[0]{
                            firstIndex = firstIndexTest
                        }
                        else if iceCream.location == row[1]{
                            secondIndex = secondIndexTest
                        }
                        firstIndexTest += 1
                        secondIndexTest += 1
                    }
                    iceCreamArray[firstIndex].location = row[2] - 1
                    iceCreamArray[secondIndex].location = row[2]
                }
            }
            if row.count == 4{
                var stop = false
                var firstIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[0]{
                        var secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[1]{
                                var thirdIndex = 0
                                for thirdIceCream in iceCreamArray{
                                    if thirdIceCream.location == row[2]{
                                        if !stop && thirdIceCream.value == secondIceCream.value{
                                            iceCreamArray.remove(at: secondIndex)
                                            if secondIndex < thirdIndex{
                                                thirdIndex -= 1
                                            }
                                            iceCreamArray.remove(at: thirdIndex)
                                            let newIceCream = IceCream(location: row[3], value: secondIceCream.value + 1)
                                            iceCreamArray.append(newIceCream)
                                            if thirdIndex < firstIndex && secondIndex < firstIndex{
                                                firstIndex -= 2
                                            }
                                            else if thirdIndex < firstIndex || secondIndex < firstIndex{
                                                firstIndex -= 1
                                            }
                                            iceCreamArray[firstIndex].location = row[3] - 1
                                            stop = true
                                            break
                                        }
                                        if !stop && secondIceCream.value == iceCream.value{
                                            iceCreamArray.remove(at: firstIndex)
                                            if firstIndex < secondIndex{
                                                secondIndex -= 1
                                            }
                                            iceCreamArray.remove(at: secondIndex)
                                            if firstIndex < thirdIndex && secondIndex < thirdIndex{
                                                thirdIndex -= 2
                                            }
                                            else if firstIndex < thirdIndex || secondIndex < thirdIndex{
                                                thirdIndex -= 1
                                            }
                                            let newIceCream = IceCream(location: row[3] - 1, value: iceCream.value + 1)
                                            iceCreamArray.append(newIceCream)
                                            iceCreamArray[thirdIndex].location = row[3]
                                            stop = true
                                            break
                                        }
                                        if !stop{
                                            iceCreamArray[thirdIndex].location = row[3]
                                            iceCreamArray[secondIndex].location = row[3] - 1
                                            iceCreamArray[firstIndex].location = row[3] - 2
                                            stop = true
                                            break
                                        }
                                    }
                                    thirdIndex += 1
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
            }
            if row.count == 5{
                var stop = false
                var firstIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[0]{
                        var secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[1]{
                                var thirdIndex = 0
                                for thirdIceCream in iceCreamArray{
                                    if thirdIceCream.location == row[2]{
                                        var fourthIndex = 0
                                        for fourthIceCream in iceCreamArray{
                                            if fourthIceCream.location == row[3]{
                                                if !stop && fourthIceCream.value == thirdIceCream.value{
                                                    iceCreamArray.remove(at: thirdIndex)
                                                    if thirdIndex < fourthIndex{
                                                        fourthIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: fourthIndex)
                                                    let newIceCream = IceCream(location: row[4], value: thirdIceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    if iceCream.value == secondIceCream.value{
                                                        if thirdIndex < secondIndex && fourthIndex < secondIndex{
                                                            secondIndex -= 2
                                                        }
                                                        else if thirdIndex < secondIndex || fourthIndex < secondIndex{
                                                            secondIndex -= 1
                                                        }
                                                        iceCreamArray.remove(at: secondIndex)
                                                        if secondIndex < firstIndex && thirdIndex < firstIndex && fourthIndex < firstIndex{
                                                            firstIndex -= 3
                                                        }
                                                        else if (secondIndex < firstIndex && thirdIndex < firstIndex) || (secondIndex < firstIndex && fourthIndex < firstIndex) || (thirdIndex < firstIndex && fourthIndex < firstIndex){
                                                            firstIndex -= 2
                                                        }
                                                        else if secondIndex < firstIndex || thirdIndex < firstIndex || fourthIndex < firstIndex{
                                                            firstIndex -= 1
                                                        }
                                                        iceCreamArray.remove(at: firstIndex)
                                                        let newIceCream = IceCream(location: row[4] - 1, value: iceCream.value + 1)
                                                        iceCreamArray.append(newIceCream)
                                                    }
                                                    else{
                                                        if thirdIndex < secondIndex && fourthIndex < secondIndex{
                                                            secondIndex -= 2
                                                        }
                                                        else if thirdIndex < secondIndex || fourthIndex < secondIndex{
                                                            secondIndex -= 1
                                                        }
                                                        iceCreamArray[secondIndex].location = row[4] - 1
                                                        if thirdIndex < firstIndex && fourthIndex < firstIndex{
                                                            firstIndex -= 2
                                                        }
                                                        else if thirdIndex < firstIndex || fourthIndex < firstIndex{
                                                            firstIndex -= 1
                                                        }
                                                        iceCreamArray[firstIndex].location = row[4] - 2
                                                    }
                                                    stop = true
                                                    break
                                                }
                                                if !stop && thirdIceCream.value == secondIceCream.value{
                                                    iceCreamArray[fourthIndex].location = row[4]
                                                    iceCreamArray.remove(at: secondIndex)
                                                    if secondIndex < thirdIndex{
                                                        thirdIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: thirdIndex)
                                                    let newIceCream = IceCream(location: row[4] - 1, value: secondIceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    if secondIndex < firstIndex && thirdIndex < firstIndex{
                                                        firstIndex -= 2
                                                    }
                                                    else if secondIndex < firstIndex || thirdIndex < firstIndex{
                                                        firstIndex -= 1
                                                    }
                                                    iceCreamArray[firstIndex].location = row[4] - 2
                                                    stop = true
                                                    break
                                                }
                                                if !stop && secondIceCream.value == iceCream.value
                                                {
                                                    iceCreamArray[fourthIndex].location = row[4]
                                                    iceCreamArray[thirdIndex].location = row[4] - 1
                                                    iceCreamArray.remove(at: firstIndex)
                                                    if firstIndex < secondIndex{
                                                        secondIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: secondIndex)
                                                    let newIceCream = IceCream(location: row[4] - 2, value: iceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    stop = true
                                                    break
                                                }
                                            }
                                            fourthIndex += 1
                                        }
                                    }
                                    thirdIndex += 1
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
            }
        }
        play()
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        var row0 = [0]
        var row1 = [4]
        var row2 = [8]
        var row3 = [12]
        var allRows = [[Int]]()
        
        for iceCream in iceCreamArray{
            if iceCream.location == 0 || iceCream.location == 1 || iceCream.location == 2 || iceCream.location == 3{
                row0.append(iceCream.location)
            }
            else if iceCream.location == 4 || iceCream.location == 5 || iceCream.location == 6 || iceCream.location == 7{
                row1.append(iceCream.location)
            }
            else if iceCream.location == 8 || iceCream.location == 9 || iceCream.location == 10 || iceCream.location == 11{
                row2.append(iceCream.location)
            }
            else if iceCream.location == 12 || iceCream.location == 13 || iceCream.location == 14 || iceCream.location == 15{
                row3.append(iceCream.location)
            }
            row0.sort()
            row1.sort()
            row2.sort()
            row3.sort()
            allRows = [row0, row1, row2, row3]
        }
        for row in allRows{
            if row.count == 2{
                var index = 0
                var testIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[1]{
                        index = testIndex
                    }
                    testIndex += 1
                }
                iceCreamArray[index].location = row[0]
            }
            if row.count == 3{
                var stop = false
                var firstIndex = 0
                var secondIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[1]{
                        secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[2]{
                                if iceCream.value == secondIceCream.value{
                                    iceCreamArray.remove(at: firstIndex)
                                    if firstIndex < secondIndex{
                                        secondIndex -= 1
                                    }
                                    iceCreamArray.remove(at: secondIndex)
                                    let newIceCream = IceCream(location: row[0], value: iceCream.value + 1)
                                    iceCreamArray.append(newIceCream)
                                    stop = true
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
                if !stop{
                    firstIndex = 0
                    secondIndex = 0
                    var firstIndexTest = 0
                    var secondIndexTest = 0
                    for iceCream in iceCreamArray{
                        if iceCream.location == row[1]{
                            firstIndex = firstIndexTest
                        }
                        else if iceCream.location == row[2]{
                            secondIndex = secondIndexTest
                        }
                        firstIndexTest += 1
                        secondIndexTest += 1
                    }
                    iceCreamArray[firstIndex].location = row[0]
                    iceCreamArray[secondIndex].location = row[0] + 1
                }
            }
            if row.count == 4{
                var stop = false
                var firstIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[1]{
                        var secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[2]{
                                var thirdIndex = 0
                                for thirdIceCream in iceCreamArray{
                                    if thirdIceCream.location == row[3]{
                                        if !stop && thirdIceCream.value == secondIceCream.value{
                                            iceCreamArray.remove(at: secondIndex)
                                            if secondIndex < thirdIndex{
                                                thirdIndex -= 1
                                            }
                                            iceCreamArray.remove(at: thirdIndex)
                                            let newIceCream = IceCream(location: row[0] + 1, value: secondIceCream.value + 1)
                                            iceCreamArray.append(newIceCream)
                                            if thirdIndex < firstIndex && secondIndex < firstIndex{
                                                firstIndex -= 2
                                            }
                                            else if thirdIndex < firstIndex || secondIndex < firstIndex{
                                                firstIndex -= 1
                                            }
                                            iceCreamArray[firstIndex].location = row[0]
                                            stop = true
                                            break
                                        }
                                        if !stop && secondIceCream.value == iceCream.value{
                                            iceCreamArray.remove(at: firstIndex)
                                            if firstIndex < secondIndex{
                                                secondIndex -= 1
                                            }
                                            iceCreamArray.remove(at: secondIndex)
                                            if firstIndex < thirdIndex && secondIndex < thirdIndex{
                                                thirdIndex -= 2
                                            }
                                            else if firstIndex < thirdIndex || secondIndex < thirdIndex{
                                                thirdIndex -= 1
                                            }
                                            let newIceCream = IceCream(location: row[0], value: iceCream.value + 1)
                                            iceCreamArray.append(newIceCream)
                                            iceCreamArray[thirdIndex].location = row[0] + 1
                                            stop = true
                                            break
                                        }
                                        if !stop{
                                            iceCreamArray[thirdIndex].location = row[0] + 2
                                            iceCreamArray[secondIndex].location = row[0] + 1
                                            iceCreamArray[firstIndex].location = row[0]
                                            stop = true
                                            break
                                        }
                                    }
                                    thirdIndex += 1
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
            }
            if row.count == 5{
                var stop = false
                var firstIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[1]{
                        var secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[2]{
                                var thirdIndex = 0
                                for thirdIceCream in iceCreamArray{
                                    if thirdIceCream.location == row[3]{
                                        var fourthIndex = 0
                                        for fourthIceCream in iceCreamArray{
                                            if fourthIceCream.location == row[4]{
                                                if !stop && iceCream.value == secondIceCream.value{
                                                    iceCreamArray.remove(at: firstIndex)
                                                    if firstIndex < secondIndex{
                                                        secondIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: secondIndex)
                                                    let newIceCream = IceCream(location: row[0], value: iceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    if thirdIceCream.value == fourthIceCream.value{
                                                        if firstIndex < thirdIndex && secondIndex < thirdIndex{
                                                            thirdIndex -= 2
                                                        }
                                                        else if firstIndex < thirdIndex || secondIndex < thirdIndex{
                                                            thirdIndex -= 1
                                                        }
                                                        iceCreamArray.remove(at: thirdIndex)
                                                        if firstIndex < fourthIndex && secondIndex < fourthIndex && thirdIndex < fourthIndex{
                                                            fourthIndex -= 3
                                                        }
                                                        else if (firstIndex < fourthIndex && secondIndex < fourthIndex) || (firstIndex < fourthIndex && thirdIndex < fourthIndex) || (secondIndex < fourthIndex && thirdIndex < fourthIndex){
                                                            fourthIndex -= 2
                                                        }
                                                        else if firstIndex < fourthIndex || secondIndex < fourthIndex || thirdIndex < fourthIndex{
                                                            fourthIndex -= 1
                                                        }
                                                        iceCreamArray.remove(at: fourthIndex)
                                                        let newIceCream = IceCream(location: row[0] + 1, value: iceCream.value + 1)
                                                        iceCreamArray.append(newIceCream)
                                                    }
                                                    else{
                                                        if firstIndex < thirdIndex && secondIndex < thirdIndex{
                                                            thirdIndex -= 2
                                                        }
                                                        else if firstIndex < thirdIndex || secondIndex < thirdIndex{
                                                            thirdIndex -= 1
                                                        }
                                                        iceCreamArray[thirdIndex].location = row[0] + 1
                                                        if firstIndex < fourthIndex && secondIndex < fourthIndex && thirdIndex < fourthIndex{
                                                            fourthIndex -= 3
                                                        }
                                                        else if (firstIndex < fourthIndex && secondIndex < fourthIndex) || (secondIndex < fourthIndex && thirdIndex < fourthIndex) || (firstIndex < fourthIndex && thirdIndex < fourthIndex){
                                                            fourthIndex -= 2
                                                        }
                                                        else if firstIndex < fourthIndex || secondIndex < fourthIndex || thirdIndex < fourthIndex{
                                                            fourthIndex -= 1
                                                        }
                                                        iceCreamArray[fourthIndex].location = row[0] + 2
                                                    }
                                                    stop = true
                                                    break
                                                }
                                                if !stop && thirdIceCream.value == secondIceCream.value{
                                                    iceCreamArray[firstIndex].location = row[0]
                                                    iceCreamArray.remove(at: secondIndex)
                                                    if secondIndex < thirdIndex{
                                                        thirdIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: thirdIndex)
                                                    let newIceCream = IceCream(location: row[0] + 1, value: secondIceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    if secondIndex < fourthIndex && thirdIndex < fourthIndex{
                                                        fourthIndex -= 2
                                                    }
                                                    else if secondIndex < fourthIndex || thirdIndex < fourthIndex{
                                                        fourthIndex -= 1
                                                    }
                                                    iceCreamArray[fourthIndex].location = row[0] + 2
                                                    stop = true
                                                    break
                                                }
                                                if !stop && thirdIceCream.value == fourthIceCream.value
                                                {
                                                    iceCreamArray[firstIndex].location = row[0]
                                                    iceCreamArray[secondIndex].location = row[0] + 1
                                                    iceCreamArray.remove(at: thirdIndex)
                                                    if thirdIndex < fourthIndex{
                                                        fourthIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: fourthIndex)
                                                    let newIceCream = IceCream(location: row[0] + 2, value: thirdIceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    stop = true
                                                    break
                                                }
                                            }
                                            fourthIndex += 1
                                        }
                                    }
                                    thirdIndex += 1
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
            }
        }
        play()
    }
    
    @IBAction func swipeUp(_ sender: Any) {
        var row0 = [0]
        var row1 = [1]
        var row2 = [2]
        var row3 = [3]
        var allRows = [[Int]]()
        
        for iceCream in iceCreamArray{
            if iceCream.location == 0 || iceCream.location == 4 || iceCream.location == 8 || iceCream.location == 12{
                row0.append(iceCream.location)
            }
            else if iceCream.location == 1 || iceCream.location == 5 || iceCream.location == 9 || iceCream.location == 13{
                row1.append(iceCream.location)
            }
            else if iceCream.location == 2 || iceCream.location == 6 || iceCream.location == 10 || iceCream.location == 14{
                row2.append(iceCream.location)
            }
            else if iceCream.location == 3 || iceCream.location == 7 || iceCream.location == 11 || iceCream.location == 15{
                row3.append(iceCream.location)
            }
            row0.sort()
            row1.sort()
            row2.sort()
            row3.sort()
            allRows = [row0, row1, row2, row3]
        }
        for row in allRows{
            if row.count == 2{
                var index = 0
                var testIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[1]{
                        index = testIndex
                    }
                    testIndex += 1
                }
                iceCreamArray[index].location = row[0]
            }
            if row.count == 3{
                var stop = false
                var firstIndex = 0
                var secondIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[1]{
                        secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[2]{
                                if iceCream.value == secondIceCream.value{
                                    iceCreamArray.remove(at: firstIndex)
                                    if firstIndex < secondIndex{
                                        secondIndex -= 1
                                    }
                                    iceCreamArray.remove(at: secondIndex)
                                    let newIceCream = IceCream(location: row[0], value: iceCream.value + 1)
                                    iceCreamArray.append(newIceCream)
                                    stop = true
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
                if !stop{
                    firstIndex = 0
                    secondIndex = 0
                    var firstIndexTest = 0
                    var secondIndexTest = 0
                    for iceCream in iceCreamArray{
                        if iceCream.location == row[1]{
                            firstIndex = firstIndexTest
                        }
                        else if iceCream.location == row[2]{
                            secondIndex = secondIndexTest
                        }
                        firstIndexTest += 1
                        secondIndexTest += 1
                    }
                    iceCreamArray[firstIndex].location = row[0]
                    iceCreamArray[secondIndex].location = row[0] + 4
                }
            }
            if row.count == 4{
                var stop = false
                var firstIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[1]{
                        var secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[2]{
                                var thirdIndex = 0
                                for thirdIceCream in iceCreamArray{
                                    if thirdIceCream.location == row[3]{
                                        if !stop && thirdIceCream.value == secondIceCream.value{
                                            iceCreamArray.remove(at: secondIndex)
                                            if secondIndex < thirdIndex{
                                                thirdIndex -= 1
                                            }
                                            iceCreamArray.remove(at: thirdIndex)
                                            let newIceCream = IceCream(location: row[0] + 4, value: secondIceCream.value + 1)
                                            iceCreamArray.append(newIceCream)
                                            if thirdIndex < firstIndex && secondIndex < firstIndex{
                                                firstIndex -= 2
                                            }
                                            else if thirdIndex < firstIndex || secondIndex < firstIndex{
                                                firstIndex -= 1
                                            }
                                            iceCreamArray[firstIndex].location = row[0]
                                            stop = true
                                            break
                                        }
                                        if !stop && secondIceCream.value == iceCream.value{
                                            iceCreamArray.remove(at: firstIndex)
                                            if firstIndex < secondIndex{
                                                secondIndex -= 1
                                            }
                                            iceCreamArray.remove(at: secondIndex)
                                            if firstIndex < thirdIndex && secondIndex < thirdIndex{
                                                thirdIndex -= 2
                                            }
                                            else if firstIndex < thirdIndex || secondIndex < thirdIndex{
                                                thirdIndex -= 1
                                            }
                                            let newIceCream = IceCream(location: row[0], value: iceCream.value + 1)
                                            iceCreamArray.append(newIceCream)
                                            iceCreamArray[thirdIndex].location = row[0] + 4
                                            stop = true
                                            break
                                        }
                                        if !stop{
                                            iceCreamArray[thirdIndex].location = row[0] + 8
                                            iceCreamArray[secondIndex].location = row[0] + 4
                                            iceCreamArray[firstIndex].location = row[0]
                                            stop = true
                                            break
                                        }
                                    }
                                    thirdIndex += 1
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
            }
            if row.count == 5{
                var stop = false
                var firstIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[1]{
                        var secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[2]{
                                var thirdIndex = 0
                                for thirdIceCream in iceCreamArray{
                                    if thirdIceCream.location == row[3]{
                                        var fourthIndex = 0
                                        for fourthIceCream in iceCreamArray{
                                            if fourthIceCream.location == row[4]{
                                                if !stop && iceCream.value == secondIceCream.value{
                                                    iceCreamArray.remove(at: firstIndex)
                                                    if firstIndex < secondIndex{
                                                        secondIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: secondIndex)
                                                    let newIceCream = IceCream(location: row[0], value: iceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    if thirdIceCream.value == fourthIceCream.value{
                                                        if firstIndex < thirdIndex && secondIndex < thirdIndex{
                                                            thirdIndex -= 2
                                                        }
                                                        else if firstIndex < thirdIndex || secondIndex < thirdIndex{
                                                            thirdIndex -= 1
                                                        }
                                                        iceCreamArray.remove(at: thirdIndex)
                                                        if firstIndex < fourthIndex && secondIndex < fourthIndex && thirdIndex < fourthIndex{
                                                            fourthIndex -= 3
                                                        }
                                                        else if (firstIndex < fourthIndex && secondIndex < fourthIndex) || (firstIndex < fourthIndex && thirdIndex < fourthIndex) || (secondIndex < fourthIndex && thirdIndex < fourthIndex){
                                                            fourthIndex -= 2
                                                        }
                                                        else if firstIndex < fourthIndex || secondIndex < fourthIndex || thirdIndex < fourthIndex{
                                                            fourthIndex -= 1
                                                        }
                                                        iceCreamArray.remove(at: fourthIndex)
                                                        let newIceCream = IceCream(location: row[0] + 4, value: iceCream.value + 1)
                                                        iceCreamArray.append(newIceCream)
                                                    }
                                                    else{
                                                        if firstIndex < thirdIndex && secondIndex < thirdIndex{
                                                            thirdIndex -= 2
                                                        }
                                                        else if firstIndex < thirdIndex || secondIndex < thirdIndex{
                                                            thirdIndex -= 1
                                                        }
                                                        iceCreamArray[thirdIndex].location = row[0] + 4
                                                        if firstIndex < fourthIndex && secondIndex < fourthIndex && thirdIndex < fourthIndex{
                                                            fourthIndex -= 3
                                                        }
                                                        else if (firstIndex < fourthIndex && secondIndex < fourthIndex) || (secondIndex < fourthIndex && thirdIndex < fourthIndex) || (firstIndex < fourthIndex && thirdIndex < fourthIndex){
                                                            fourthIndex -= 2
                                                        }
                                                        else if firstIndex < fourthIndex || secondIndex < fourthIndex || thirdIndex < fourthIndex{
                                                            fourthIndex -= 1
                                                        }
                                                        iceCreamArray[fourthIndex].location = row[0] + 8
                                                    }
                                                    stop = true
                                                    break
                                                }
                                                if !stop && thirdIceCream.value == secondIceCream.value{
                                                    iceCreamArray[firstIndex].location = row[0]
                                                    iceCreamArray.remove(at: secondIndex)
                                                    if secondIndex < thirdIndex{
                                                        thirdIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: thirdIndex)
                                                    let newIceCream = IceCream(location: row[0] + 4, value: secondIceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    if secondIndex < fourthIndex && thirdIndex < fourthIndex{
                                                        fourthIndex -= 2
                                                    }
                                                    else if secondIndex < fourthIndex || thirdIndex < fourthIndex{
                                                        fourthIndex -= 1
                                                    }
                                                    iceCreamArray[fourthIndex].location = row[0] + 8
                                                    stop = true
                                                    break
                                                }
                                                if !stop && thirdIceCream.value == fourthIceCream.value
                                                {
                                                    iceCreamArray[firstIndex].location = row[0]
                                                    iceCreamArray[secondIndex].location = row[0] + 4
                                                    iceCreamArray.remove(at: thirdIndex)
                                                    if thirdIndex < fourthIndex{
                                                        fourthIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: fourthIndex)
                                                    let newIceCream = IceCream(location: row[0] + 8, value: thirdIceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    stop = true
                                                    break
                                                }
                                            }
                                            fourthIndex += 1
                                        }
                                    }
                                    thirdIndex += 1
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
            }
        }
        play()
    }
    
    @IBAction func swipeDown(_ sender: Any) {
        var row0 = [12]
        var row1 = [13]
        var row2 = [14]
        var row3 = [15]
        var allRows = [[Int]]()
        
        for iceCream in iceCreamArray{
            if iceCream.location == 0 || iceCream.location == 4 || iceCream.location == 8 || iceCream.location == 12{
                row0.append(iceCream.location)
            }
            else if iceCream.location == 1 || iceCream.location == 5 || iceCream.location == 9 || iceCream.location == 13{
                row1.append(iceCream.location)
            }
            else if iceCream.location == 2 || iceCream.location == 6 || iceCream.location == 10 || iceCream.location == 14{
                row2.append(iceCream.location)
            }
            else if iceCream.location == 3 || iceCream.location == 7 || iceCream.location == 11 || iceCream.location == 15{
                row3.append(iceCream.location)
            }
            row0.sort()
            row1.sort()
            row2.sort()
            row3.sort()
            allRows = [row0, row1, row2, row3]
        }
        for row in allRows{
            if row.count == 2{
                var index = 0
                var testIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[0]{
                        index = testIndex
                    }
                    testIndex += 1
                }
                iceCreamArray[index].location = row[1]
            }
            if row.count == 3{
                var stop = false
                var firstIndex = 0
                var secondIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[0]{
                        secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[1]{
                                if iceCream.value == secondIceCream.value{
                                    iceCreamArray.remove(at: firstIndex)
                                    if firstIndex < secondIndex{
                                        secondIndex -= 1
                                    }
                                    iceCreamArray.remove(at: secondIndex)
                                    let newIceCream = IceCream(location: row[2], value: iceCream.value + 4)
                                    iceCreamArray.append(newIceCream)
                                    stop = true
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
                if !stop{
                    firstIndex = 0
                    secondIndex = 0
                    var firstIndexTest = 0
                    var secondIndexTest = 0
                    for iceCream in iceCreamArray{
                        if iceCream.location == row[0]{
                            firstIndex = firstIndexTest
                        }
                        else if iceCream.location == row[1]{
                            secondIndex = secondIndexTest
                        }
                        firstIndexTest += 1
                        secondIndexTest += 1
                    }
                    iceCreamArray[firstIndex].location = row[2] - 16
                    iceCreamArray[secondIndex].location = row[2]
                }
            }
            if row.count == 4{
                var stop = false
                var firstIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[0]{
                        var secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[1]{
                                var thirdIndex = 0
                                for thirdIceCream in iceCreamArray{
                                    if thirdIceCream.location == row[2]{
                                        if !stop && thirdIceCream.value == secondIceCream.value{
                                            iceCreamArray.remove(at: secondIndex)
                                            if secondIndex < thirdIndex{
                                                thirdIndex -= 1
                                            }
                                            iceCreamArray.remove(at: thirdIndex)
                                            let newIceCream = IceCream(location: row[3], value: secondIceCream.value + 1)
                                            iceCreamArray.append(newIceCream)
                                            if thirdIndex < firstIndex && secondIndex < firstIndex{
                                                firstIndex -= 2
                                            }
                                            else if thirdIndex < firstIndex || secondIndex < firstIndex{
                                                firstIndex -= 1
                                            }
                                            iceCreamArray[firstIndex].location = row[3] - 16
                                            stop = true
                                            break
                                        }
                                        if !stop && secondIceCream.value == iceCream.value{
                                            iceCreamArray.remove(at: firstIndex)
                                            if firstIndex < secondIndex{
                                                secondIndex -= 1
                                            }
                                            iceCreamArray.remove(at: secondIndex)
                                            if firstIndex < thirdIndex && secondIndex < thirdIndex{
                                                thirdIndex -= 2
                                            }
                                            else if firstIndex < thirdIndex || secondIndex < thirdIndex{
                                                thirdIndex -= 1
                                            }
                                            let newIceCream = IceCream(location: row[3] - 16, value: iceCream.value + 1)
                                            iceCreamArray.append(newIceCream)
                                            iceCreamArray[thirdIndex].location = row[3]
                                            stop = true
                                            break
                                        }
                                        if !stop{
                                            iceCreamArray[thirdIndex].location = row[3]
                                            iceCreamArray[secondIndex].location = row[3] - 4
                                            iceCreamArray[firstIndex].location = row[3] - 8
                                            stop = true
                                            break
                                        }
                                    }
                                    thirdIndex += 1
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
            }
            if row.count == 5{
                var stop = false
                var firstIndex = 0
                for iceCream in iceCreamArray{
                    if iceCream.location == row[0]{
                        var secondIndex = 0
                        for secondIceCream in iceCreamArray{
                            if secondIceCream.location == row[1]{
                                var thirdIndex = 0
                                for thirdIceCream in iceCreamArray{
                                    if thirdIceCream.location == row[2]{
                                        var fourthIndex = 0
                                        for fourthIceCream in iceCreamArray{
                                            if fourthIceCream.location == row[3]{
                                                if !stop && fourthIceCream.value == thirdIceCream.value{
                                                    iceCreamArray.remove(at: thirdIndex)
                                                    if thirdIndex < fourthIndex{
                                                        fourthIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: fourthIndex)
                                                    let newIceCream = IceCream(location: row[4], value: thirdIceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    if iceCream.value == secondIceCream.value{
                                                        if thirdIndex < secondIndex && fourthIndex < secondIndex{
                                                            secondIndex -= 2
                                                        }
                                                        else if thirdIndex < secondIndex || fourthIndex < secondIndex{
                                                            secondIndex -= 1
                                                        }
                                                        iceCreamArray.remove(at: secondIndex)
                                                        if secondIndex < firstIndex && thirdIndex < firstIndex && fourthIndex < firstIndex{
                                                            firstIndex -= 3
                                                        }
                                                        else if (secondIndex < firstIndex && thirdIndex < firstIndex) || (secondIndex < firstIndex && fourthIndex < firstIndex) || (thirdIndex < firstIndex && fourthIndex < firstIndex){
                                                            firstIndex -= 2
                                                        }
                                                        else if secondIndex < firstIndex || thirdIndex < firstIndex || fourthIndex < firstIndex{
                                                            firstIndex -= 1
                                                        }
                                                        iceCreamArray.remove(at: firstIndex)
                                                        let newIceCream = IceCream(location: row[4] - 4, value: iceCream.value + 1)
                                                        iceCreamArray.append(newIceCream)
                                                    }
                                                    else{
                                                        if thirdIndex < secondIndex && fourthIndex < secondIndex{
                                                            secondIndex -= 2
                                                        }
                                                        else if thirdIndex < secondIndex || fourthIndex < secondIndex{
                                                            secondIndex -= 1
                                                        }
                                                        iceCreamArray[secondIndex].location = row[4] - 4
                                                        if thirdIndex < firstIndex && fourthIndex < firstIndex{
                                                            firstIndex -= 2
                                                        }
                                                        else if thirdIndex < firstIndex || fourthIndex < firstIndex{
                                                            firstIndex -= 1
                                                        }
                                                        iceCreamArray[firstIndex].location = row[4] - 8
                                                    }
                                                    stop = true
                                                    break
                                                }
                                                if !stop && thirdIceCream.value == secondIceCream.value{
                                                    iceCreamArray[fourthIndex].location = row[4]
                                                    iceCreamArray.remove(at: secondIndex)
                                                    if secondIndex < thirdIndex{
                                                        thirdIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: thirdIndex)
                                                    let newIceCream = IceCream(location: row[4] - 4, value: secondIceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    if secondIndex < firstIndex && thirdIndex < firstIndex{
                                                        firstIndex -= 2
                                                    }
                                                    else if secondIndex < firstIndex || thirdIndex < firstIndex{
                                                        firstIndex -= 1
                                                    }
                                                    iceCreamArray[firstIndex].location = row[4] - 8
                                                    stop = true
                                                    break
                                                }
                                                if !stop && secondIceCream.value == iceCream.value
                                                {
                                                    iceCreamArray[fourthIndex].location = row[4]
                                                    iceCreamArray[thirdIndex].location = row[4] - 4
                                                    iceCreamArray.remove(at: firstIndex)
                                                    if firstIndex < secondIndex{
                                                        secondIndex -= 1
                                                    }
                                                    iceCreamArray.remove(at: secondIndex)
                                                    let newIceCream = IceCream(location: row[4] - 8, value: iceCream.value + 1)
                                                    iceCreamArray.append(newIceCream)
                                                    stop = true
                                                    break
                                                }
                                            }
                                            fourthIndex += 1
                                        }
                                    }
                                    thirdIndex += 1
                                }
                            }
                            secondIndex += 1
                        }
                    }
                    firstIndex += 1
                }
            }
        }
        play()
    }
    
    func play(){
        let newIceCream = IceCream(location: randomLocation())
        if !gameOver{
            iceCreamArray.append(newIceCream)
            update()
        }
        else{
            let alert = UIAlertController(title: "Game Over!", message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Reset", style: .default){
                (action) -> Void in self.resetGame()
            }
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func update(){
        for location in locationsArray{
            location.image = UIImage(named: "basic")
        }
        scoreNum = 0
        var maxIceCream = iceCreamArray[0]
        for iceCream in iceCreamArray{
            scoreNum += iceCream.value
            locationsArray[iceCream.location].image = UIImage(named: "\(iceCream.type)")
            if iceCream.value > maxIceCream.value{
                maxIceCream = iceCream
            }
            if iceCream.type == "rainbow"{
                youWin = true
            }
        }
        max.text = maxIceCream.type
        score.text = "\(scoreNum)"
        if youWin{
            let alert = UIAlertController(title: "You Win!", message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Reset", style: .default){
                (action) -> Void in self.resetGame()
            }
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func resetGame(){
        scoreNum = 0
        score.text = "0"
        gameOver = false
        youWin = false
        max.text = ""
        iceCreamArray.removeAll()
        for location in locationsArray{
            location.image = UIImage(named: "basic")
        }
        play()
        play()
    }
}

