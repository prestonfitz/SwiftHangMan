//
//  Game.swift
//  HangMan
//
//  Created by IS 543 on 12/16/24.
//

import Foundation

class Game {
    var word: String = ""
    var numGuesses: Int = 0
    var numMistakes: Int = 0
    var correctlyGuessedLetters: Set<Character> = []
    var correct: Bool = false
    var dead: Bool = false
    let gameWords = ["potato", "caramel", "hamburger", "pizza", "sandwich", "cheesecake", "chocolate", "ketchup", "mayonnaise", "barbecue"]
    let gallowsArt = [
        """
          __________
          |         |
          |
          |
          |
          |
          |
          |
        __|__
        """,
        """
          __________
          |         |
          |         O
          |
          |
          |
          |
          |
        __|__
        """,
        """
          __________
          |         |
          |         O
          |         |
          |         |
          |
          |
          |
        __|__
        """,
        """
          __________
          |         |
          |        _O
          |       / |
          |         |
          |
          |
          |
        __|__
        """,
        """
          __________
          |         |
          |        _O_
          |       / | \\
          |         |
          |
          |
          |
        __|__
        """,
        """
          __________
          |         |
          |        _O_
          |       / | \\
          |         |
          |       _/
          |       
          |
        __|__
        """,
        """
          __________
          |         |
          |        _O_
          |       / | \\
          |         |
          |       _/\\_
          |       
          |
        __|__
        """
    ]

    
    func guess(_ letter: LetterButton) -> Bool{
        
        numGuesses += 1
        
        if word.contains(letter.letter) {
            correctlyGuessedLetters.insert(letter.letter)
            letter.markCorrect()
            return true
        } else {
            numMistakes += 1
            letter.markIncorrect()
            if numMistakes == 6{
                dead = true
            }
            return false
        }
    }
    
    func NewGame() {
        word = gameWords[Int.random(in: 0..<gameWords.count)]
        correctlyGuessedLetters.removeAll()
        numGuesses = 0
        numMistakes = 0
        dead = false
        correct = false
    }
    
    func returnAsciiArt() -> String {
        return gallowsArt[numMistakes];
    }
}
