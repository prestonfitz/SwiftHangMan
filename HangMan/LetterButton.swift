//
//  LetterButton.swift
//  HangMan
//
//  Created by IS 543 on 12/16/24.
//

import Foundation
import SwiftUI

@Observable class LetterButton {
    
    init(letter: Character) {
        self.letter = letter
    }
    
    let letter: Character
    var state: State = .notSelected
    var backColor: Color {
        switch state {
        case .correct: return .green
        case .incorrect: return .red
        case .notSelected: return .blue
        }
    }
    var textColor: Color {
        switch state {
        case .correct: return .white
        case .incorrect: return .white
        case .notSelected: return .black
        }
    }
    
    func markCorrect(){
        state = .correct
    }
    
    func markIncorrect(){
        state = .incorrect
    }
}


enum State {
    case correct
    case incorrect
    case notSelected
}
