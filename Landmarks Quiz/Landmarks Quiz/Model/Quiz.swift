//
//  Quiz.swift
//  Landmarks Quiz
//
//  Created by Haytham on 18/09/2023.
//

import UIKit

public struct Quiz {
    
    let images = [UIImage(named: "Indonesia 1"),UIImage(named: "Japan 1"),UIImage(named: "China1"),UIImage(named: "India 1"),  UIImage(named: "Egypt 1"), UIImage(named: "France 1"),UIImage(named: "USA 1"),UIImage(named: "UAE 3"),UIImage(named: "India 2"),UIImage(named: "UK 1"), UIImage(named: "UAE 2"),  UIImage(named: "USA 2"), UIImage(named: "Saudi 1"),UIImage(named: "UAE 1"), UIImage(named: "Egypt 2"), UIImage(named: "Jordan 1")]
    
    var choices = [
        ["Indonesia","Japan","China","Korea"],
        ["Japan","USA","France","Jordan"],
        ["China","Japan","Indonesia","Korea"],
        ["India","Pakistan","USA","China"],
        ["Egypt","Jordan","Syria","Sudan"],
        ["France","UK","Italy","Brazil"],
        ["USA","UK","France","Italy"],
        ["UAE","Saudi Arabia","Kuwait","Bahrain"],
        ["India","Pakistan","Iran","Turkey"],
        ["UK","USA","Brazil","Korea"],
        ["UAE","Bahrain","Kuwait","USA"],
        ["USA","France","Italy","China"],
        ["Saudi Arabia","UAE","Bahrain","Oman"],
        ["UAE","Oman","Bahrain","Jordan"],
        ["Egypt","Morocco","Tunis","Sudan"],
        ["Jordan","Egypt","Morocco","Tunis"]]
    
    var currentChoicesArr = 0
    var score = 0
    var gameIsActive = true
    
    
    mutating func checkAnswer(answer: String) -> Bool {
        if gameIsActive {
            if answer == choices[currentChoicesArr][0] {
                print("Correct")
                score += 10
                return true
            } else {
                print("Wrong")
                return false
            }
        }
        return false
    }
    
    mutating func displayNextQuestion() {
        
        if currentChoicesArr >= images.count - 1 {
            print("User completed the game")
            gameIsActive = false
        } else {
            currentChoicesArr += 1
        }
    }
    
    mutating func resetGame() {
        gameIsActive = true
        score = 0
        currentChoicesArr = 0
    }
}
