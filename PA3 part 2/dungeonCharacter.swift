//
//  HeroesVsMonsters.swift
//  dungeonCharacter.swift
//  Heroes vs Monsters
//  This program stimulates the the base class dungeon character for the specific subclasses, monster and hero
//  CPSC 315-01, Fall 2018
//  Programing assigment number 3 task 2
//  No sources to cite
//  Created by Makayla Moniz on 9/20/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import Foundation

/**
 */
 
 class DungeonCharacter{
    var name: String = ""
    var hitPoints: Int
    var attackSpeed: Int
    var minDamage: Int
    var maxDamage: Int
    var hitChance: Double
    
    init(){
        self.name = "Dungeon Characteer"
        self.hitPoints = 0
        self.attackSpeed = 1
        self.minDamage = 0
        self.maxDamage = 0
        self.hitChance = 0
    
        
    }
    
    init(name: String, hitPoints: Int, attackSpeed: Int, minDamage: Int, maxDamage: Int, hitChance: Double)
    {
        self.name = name
        self.hitPoints = hitPoints
        self.attackSpeed = attackSpeed
        self.minDamage = minDamage
        self.maxDamage = maxDamage
        self.hitChance = hitChance
    }
    
    /**
     function that checks if a character can attack, if it can, it attacks its opponent and removess an ammount of points between the charcaters max and min damage
    
     - Parameter opponent: a dungeon character that the current dungeon character is attacking
     - Returns: true if the character succesfully could attack, false otherwise
    */
    func attack(opponent: DungeonCharacter) -> Bool {
        if Int(arc4random_uniform(UInt32(10))) < Int(hitChance*10){
            let damageAmount = Int(arc4random_uniform(UInt32((maxDamage - minDamage)+1)) + UInt32(minDamage))
            opponent.hitPoints -= damageAmount
            return true
        }
        else{
            return false
        }
    }
    
    
/**
     returns a true or false depending on if the character is alive or not
     
     - Returns: true if the character is alive, false, otherwise
 */
    
    func characterAlive() -> Bool{
        if self.hitPoints <= 0{
            return false
        }
        else{
            return true
        }
    }
    
    /**
     This is a block funtion meant to be overridden in the hero class
     */
    func block(opponent: DungeonCharacter) -> Bool {
        print("I'm sorry, your DungeonCharcter does not have the capabillity to block another character")
        return false
    }
}
