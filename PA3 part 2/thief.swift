//
//  theif.swift
//  PA3 part 2
//  This program stimulates a Thief character
//  CPSC 315-01, Fall 2018
//  Programing assigment number 3 task 2
//  Created by Makayla Moniz on 9/20/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import Foundation

class Thief: Hero{
    
    override init(){
        super.init(name: "Thief", hitPoints: 75, attackSpeed: 6, damageMin: 20, damageMax: 40, hitChance: 0.8, chanceToBlock: 0.4)
    }
    /**
     This function is a special attack specific to a thief. The thiefs special attack is a Surprise Attack.
     There is a 40 percent chance the thief gets a special attack (aka a normal attack and an extra turn.
     There is a 40 percent chance the thief doesn't get a special attack and just gets a chance at a normal attack.
     THere is a 20 percent chance the thief is caught and doesn't get a surprise or normal attack.
     
     - Parameter opponent: the character that is being attacked by our current charcater
     
     - Returns:
        - surpriseSuccess: true if the character succesfully completed the surprise attack and gets another turn, false otherwise
     - checkAlive: true if the "normal attack" completed was successful (AKA caused damage to the opponent), false otherwise
     */
    func supriseAttack(opponent: DungeonCharacter) -> (supriseSuccess: Bool, checkAlive: Bool) {
        if Int(arc4random_uniform(UInt32(10))) < Int(hitChance*8){
            if Int(arc4random_uniform(UInt32(10))) < Int(hitChance*5){
                print("\(self.name) is going to perform a SUPRISE ATTACK.")
                print("A SUPRISE ATTACK is like a normal attack with an extra turn.")
                if self.attack(opponent: opponent){
                    return (true, true)
                }
                return (true, false)
            }
            else{
                print("Unable to perform a suprise attack, will perform a normal attack instead.")
                if self.attack(opponent: opponent){
                    return (false, true)
                }
                return (false, false)
            }
        }
        else{
            print("\(self.name) is going to try to perform a SUPRISE ATTACK.")
            print("A SUPRISE ATTACK is like a normal attack with another turn.")
            print("\(self.name) tries the SUPRISE ATTACK on \(opponent.name), but gets caught, no additional turn is given.")
            return (false, false)
        }
    }
}

    

