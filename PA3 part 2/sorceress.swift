//
//  sorceress.swift
//  PA3 part 2
//  This program stimulates a Corceress character
//  CPSC 315-01, Fall 2018
//  Programing assigment number 3 task 2
//  Created by Makayla Moniz on 9/20/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import Foundation

class Sorceress: Hero{
    var minHeal: Int
    var maxHeal: Int
    
    override init(){
        minHeal = 0
        maxHeal = 25
        super.init(name: "Sorceress", hitPoints: 75, attackSpeed: 6, damageMin: 20, damageMax: 40, hitChance: 0.8, chanceToBlock: 0.4)
    }
    
    /**
     function for sorceresses special attack which is to heal.
     */
    func heal() {
        let healAmount = Int(arc4random_uniform(UInt32((self.maxHeal - self.minHeal)+1)) + UInt32(minHeal))
        self.hitPoints += healAmount
        print("\(self.name) is going to HEAL.")
        print("The Sorceress can heal between \(self.minHeal) to \(self.maxHeal) hit points.")
        print("\(self.name) healed \(healAmount) points")
    }
    
}
