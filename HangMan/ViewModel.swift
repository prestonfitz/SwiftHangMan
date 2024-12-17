//
//  ViewModel.swift
//  HangMan
//
//  Created by IS 543 on 12/16/24.
//

import Foundation

@Observable
class ViewModel {
    var currentGame: Game = Game()
    var letterButtons: [LetterButton] = []
    var gallows: String = ""
    var activeGame = false
    var playingWord = ""
    
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    func setPlayingWord() {
        if !currentGame.word.isEmpty{
            playingWord = ""
            
            for letter in currentGame.word{
                if currentGame.correctlyGuessedLetters.contains(letter){
                    playingWord += String(letter) + " "
                } else {
                    playingWord += "_ "
                }
            }
            
            if !playingWord.contains("_"){
                activeGame = false
            }
            
        } else{
            playingWord = ""
        }
    }
    
    func newGame() {
        currentGame.NewGame()
        
        letterButtons.removeAll()
        
        for letter in alphabet {
            letterButtons.append(LetterButton(letter: letter))
        }
        
        setPlayingWord()
        gallows = currentGame.returnAsciiArt()
        activeGame = true
    }
    
    func guess(letter: LetterButton) {
        if activeGame{
            var activeButton: LetterButton
            
            for button in letterButtons {
                if button.letter == letter.letter{
                    activeButton = letter
                    
                    let correctness = currentGame.guess(letter)
                    
                    if correctness{
                        activeButton.state = .correct
                    } else {
                        activeButton.state = .incorrect
                    }
                }
            }
            
            gallows = currentGame.returnAsciiArt()
            setPlayingWord()
            
            if currentGame.dead{
                activeGame = false
            }
        }
    }	
}
