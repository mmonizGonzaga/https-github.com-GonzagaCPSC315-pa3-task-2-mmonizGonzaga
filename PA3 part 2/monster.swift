//
//  monster.swift
//  PA3 part 2
//  This program stimulates the base monster class for the specific monster subclasses of Ogre, Gremlin, and Skeleton
//  CPSC 315-01, Fall 2018
//  Programing assigment number 3 task 2
//  Created by Makayla Moniz on 9/20/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import Foundation

class Monster: DungeonCharacter{
    var chanceToHeal: Double
    var maxHeal: Int
    var minHeal: Int

    override init(){
        self.chanceToHeal = 0.0
        self.maxHeal = 0
        self.minHeal = 0
        super.init()
    }
    
    init(name: String, hitPoints: Int, attackSpeed: Int, damageMin: Int, damageMax: Int, hitChance: Double, chanceToHeal: Double, minHeal: Int, maxHeal: Int) {
        self.chanceToHeal = chanceToHeal
        self.maxHeal = maxHeal
        self.minHeal = minHeal
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, minDamage: damageMin, maxDamage: damageMax, hitChance: hitChance)
    }
    
    /**
     function that checks if a monster can heaL, and if it can, it heals.
     
     - Returns: true if the character succesfully could successfuly heal, false otherwise
     */
    func heal() -> Bool {
        if canHeal(){
            let healAmount = Int(arc4random_uniform(UInt32((self.maxHeal - self.minHeal)+1)) + UInt32(minHeal))
            self.hitPoints += healAmount
            print("\(self.name) healed \(healAmount) points")
            return true
        }
        else{
            print("\(self.name) cannot heal at this time")
            return false
        }
    }
    
    /**
     uses the characters heal chance to determine if the chacater can heal
     
     - Returns: true if the character can heal, false otherwise
     */
    func canHeal() -> Bool {
        if Int(arc4random_uniform(UInt32(10))) < Int(chanceToHeal*10){
            return true
        }
        else{
            return false
        }
    }
    
    /**
     function that checks if a character can attack, if it can, it attacks its opponent and removess an ammount of points between the charcaters max and min damage
     
     - Parameter opponent: a character that our current character is attacking
     
     - Returns: true if the character succesfully could attack, false otherwise
     */
    override func attack(opponent: DungeonCharacter) -> Bool {
        if canAttack(){
            if opponent.block(opponent: self){
                return false
            }
            else{
                 let damageAmount = Int(arc4random_uniform(UInt32((maxDamage - minDamage)+1)) + UInt32(minDamage))
                opponent.hitPoints -= damageAmount
                print("\(self.name) attacks \(opponent.name)")
                print("\(opponent.name) is attacked for \(damageAmount) points")
                return true
            }
        }
        else{
            print("\(self.name) tries to attack \(opponent.name), but is unsuccessful")
            return false
        }
    }
    
    /**
     uses the characters hit chance to determine if the chacater can attack its opponent
     
     - Returns: true if the character can attack, false otherwise
     */
     func canAttack() -> Bool {
        if Int(arc4random_uniform(UInt32(10))) < Int(hitChance*10){
            return true
        }
        else{
            return false
        }
    }
}




