//
//  HeroesVsMonsters.swift
//  Hero.swift
//  Heroes vs Monsters
//  This program stimulates the class hero for the specific subclasses Warrior, Sorceress, and Theif
//  CPSC 315-01, Fall 2018
//  Programing assigment number 3 task 2
//  No sources to cite

//  Created by Makayla Moniz on 9/20/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import Foundation

class Hero: DungeonCharacter{
    var chanceToBlock: Double
    var numTurns: Int = 0
    let heroType: String = "Hero"
    
    override init(){
        self.chanceToBlock = 0.0
        super.init()
        numTurns = 0
    }
    
    init(name: String, hitPoints: Int, attackSpeed: Int, damageMin: Int, damageMax: Int, hitChance: Double,  chanceToBlock: Double) {
        self.chanceToBlock = chanceToBlock
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, minDamage: damageMin, maxDamage: damageMax, hitChance: hitChance)
        numTurns = 0
    }
    
    /**
    Calculates and sets the number of turns the hero will get based on how many time faster they are then their opponent
     */
    func setNumTurns(opponent: DungeonCharacter){
        numTurns = self.attackSpeed / opponent.attackSpeed
    }
    
    /**
     checks if the hero can block the opponents attack
     
     - Parameter opponent: the opponent/character that our current character is blocking
     - Returns: true if the hero can clock the attack, false otherwise
     */
    override func block(opponent: DungeonCharacter) -> Bool{
        if Int(arc4random_uniform(UInt32(10))) < Int(chanceToBlock*10){
            print("\(self.name) blocked \(opponent.name)'s attack")
            return true
        }
        else{
            return false
        }
    }
    
    /**
     function that checks if a character can attack, if it can, it attacks its opponent and removess an ammount of points between the charcaters max and min damage

     - Parameter opponent: the character that is being attacked by our current charcater
     
     - Returns: true if the character succesfully could attack, false otherwise
     */
    override func attack(opponent: DungeonCharacter) -> Bool {
        if canAttack(){
            let damageAmount = Int(arc4random_uniform(UInt32((maxDamage - minDamage)+1)) + UInt32(minDamage))
            opponent.hitPoints -= damageAmount
            print("\(self.name) attacks \(opponent.name)")
            print("\(opponent.name) is attacked for \(damageAmount) points")
            return true
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


