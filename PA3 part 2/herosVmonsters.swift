//
//  HeroesVsMonsters.swift
//  herosVmonsters.swift
//  Heroes vs Monsters
//  This program stimulates the game of Heroes vs Monsters
//  CPSC 315-01, Fall 2018
//  Programing assigment number 3 task 2
//  Sorces: https://www.hackingwithswift.com/read/0/20/polymorphism-and-typecasting to learn about forced downcasting (used in heroTurn function
//  Created by Makayla Moniz on 9/20/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import Foundation

class HeroesVsMonsters{
    var hero: Hero
    var monster: Monster
    var playing: Bool
    var addedTurn: Bool
    
    init(){
        hero = Hero()
        monster = Monster()
        playing = true
        addedTurn = false
    }
    
    /**
     promts user to pick a hero as his/her character
     */
    func selectHero() {
        print("Please choose a character from the following options (Enter 1, 2, or 3)")
        print(" 1. Warrior \n 2. Sorceress \n 3. Thief")
        
        let ans = Int(readLine() ?? "1")
        
        if (ans) == 1{
            hero = Warrior()
        }
        else if (ans) == 2{
            hero = Sorceress()
        }
        else{
           hero = Thief()
        }
        getHeroName()
    }
    
    /**
     prompts user to give the hero a name
    */
    func getHeroName(){
        print("What is the name of your hero?")
        let name = readLine() ?? "My Hero"
        hero.name = name
        print("Your heroes name is \(name)")
    }
    
    /**
    Randomly selects one of three possible monsters to battle the chosen hero
    */
    func selectMonster(){
        let monsterSelection = Int(arc4random_uniform(UInt32(3)))
        if monsterSelection == 0{
            monster = Ogre()
        }
        else if monsterSelection == 1{
            monster = Gremlin()
        }
        else{
            monster = Skeleton()
        }
        hero.setNumTurns(opponent: monster)
        print("Your hero is battling \(monster.name)")
        print("Press enter to continue...")
        readLine()
    }
    
    /**
     function that completes one turn for the hero character based on users input. The hero either completes a normal attack, special attack, or quits game
     */
    func heroesTurn(){
        print("Please choose your attack from the following menu")
        print(" 1. Normal attack \n 2. Special attack \n 3. Quit")
        let choice = Int(readLine() ?? "3")
        if choice == 1{
            if hero.attack(opponent: monster){
                if monster.characterAlive(){
                    monster.heal()
                }
                else{
                    playing = false
                    print("\(monster.name) has no more hit points, \(hero.name) wins.")
                }
            }
        }
        else if choice == 2{
            if type(of: hero) == Warrior.self{
                if (hero as! Warrior).crushingBlow(opponent: monster){
                    if monster.characterAlive(){
                        monster.heal()
                    }
                    else{
                        playing = false
                        print("\(monster.name) has no more hit points, \(hero.name) wins.")
                    }
                }
            }
            else if type(of: hero) == Sorceress.self{
                (hero as! Sorceress).heal()
            }
            else{
                let supriseResults = (hero as! Thief).supriseAttack(opponent: monster)
                if supriseResults.checkAlive{
                    if monster.characterAlive(){
                        monster.heal()
                    
                    }
                    else{
                        playing = false
                        print("\(monster.name) has no more hit points, \(hero.name) wins.")
                    }
                }
                if supriseResults.supriseSuccess && playing == true{
                    addedTurn = true
                }
            }
        }
        else {
            playing = false
        }
        
        if playing{
            print("Press enter to continue")
            readLine()
        }
    }
    
    /**
     Function that completes one turn for the monster character. The monster always tries to attack if possible
     */
    func monsterTurn(){
        if monster.attack(opponent: hero){
            if (!hero.characterAlive()){
                playing = false
                print(" Oh no! \(hero.name) has no more hit points, \(monster.name) wins!")
            }
        }
        print("Press enter to continue")
        let go = readLine()
    }
    
    /**
     This is the game loop that controlls the game play
     */
    func play(){
        print("Welcome to Heroes Vs Monsters!")
        selectHero()
        selectMonster()
        
        while(playing){
            var heroTurns = hero.numTurns
            var currentTurn = 1
            while(currentTurn <= heroTurns){
                print("~~~ \(hero.name)'s turn (\(currentTurn) of \(heroTurns))~~~")
                print("\(hero.name) \(hero.hitPoints) hit points")
                print("\(monster.name) \(monster.hitPoints) hit points")
               
                heroesTurn()
                
                if addedTurn{
                    heroTurns += 1
                    addedTurn = false
                }
                
                // if we arnt playing, skip the rest of hero's turns
                if !playing{
                    currentTurn = heroTurns
                }
                
                currentTurn+=1
            }
            if playing{
                print("~~~ \(monster.name)'s turn ~~~")
                print("\(hero.name) \(hero.hitPoints) hit points")
                print("\(monster.name) \(monster.hitPoints) hit points")
                
                monsterTurn()
            }
            if !playing{
                print("Would you like to play again? (Y/N)")
                let ans = readLine() ?? ""
                if ans == "n" || ans == "N"{
                    print("Thanks for playing!")
                }
                else{
                    print("Welcome to another round of Heroes vs Monsters!")
                    selectHero()
                    selectMonster()
                    playing = true
                    heroTurns = hero.numTurns
                }
            }
        }
    }
}


