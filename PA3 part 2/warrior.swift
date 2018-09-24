//
//  warrior.swift
//  PA3 part 2
//  This program stimulates a warrior character
//  CPSC 315-01, Fall 2018
//  Programing assigment number 3 task 2
//  Created by Makayla Moniz on 9/20/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import Foundation

class Warrior: Hero{
    
    override init(){
        super.init(name: "Warrior", hitPoints: 25, attackSpeed: 4, damageMin: 35, damageMax: 60, hitChance: 0.8, chanceToBlock: 0.2)
    }
    
        
    /**
       This function is a special attack specific to a warrior, it has a 40% chance of success and can cause between 75 and 175 points of damage to opponent
         
        - Parameter opponent: the character that is being attacked by our current charcater
         
        - Returns: true if the character succesfully could attack, false otherwise
         */
        func crushingBlow(opponent: DungeonCharacter) -> Bool {
           if Int(arc4random_uniform(UInt32(10))) < Int(hitChance*4){
                let damageAmount = Int(arc4random_uniform(UInt32((175 - 75)+1)) + UInt32(75))
                opponent.hitPoints -= damageAmount
                print("\(self.name) is going to perform a CRUSHING BLOW")
                print("A CRUSHING BLOW is like a normal attack with a possible 75 to 175 points of damage, but only has a 40% chance of success.")
                print("\(opponent.name) is attacked for \(damageAmount) points")
                return true
            }
            else{
                print("\(self.name) is going to try to perform a CRUSHING BLOW")
                print("A CRUSHING BLOW is like a normal attack with a possible 75 to 175 points of damage, but only has a 40% chance of success.")
                print("\(self.name) tries the CRUSHING BLOW on \(opponent.name), but is unsuccessful")
                return false
            }
        }
    
}
