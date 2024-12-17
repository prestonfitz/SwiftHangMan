//
//  ContentView.swift
//  HangMan
//
//  Created by IS 543 on 12/16/24.
//

import SwiftUI

struct ContentView: View {
    let viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Hangman Game")
                .font(.title)
            
            if !viewModel.activeGame{
                Button(action: {
                    viewModel.newGame()
                }) {
                    Text("New Game")
                }
                .buttonStyle(.bordered)
            }
            
            Text("\(viewModel.gallows)")
                .frame(maxWidth: .infinity)
                .padding()
            
            Text("\(viewModel.playingWord)")
                .padding()
            
            if !viewModel.activeGame && !viewModel.currentGame.dead && viewModel.playingWord != "" {
                Text("Congratulations! You escaped the gallows!")
                    .padding()
            }
            
            if viewModel.currentGame.dead {
                Text("I'm sorry, but you've lost your breathing privileges. Also, the letter was \(viewModel.currentGame.word).")
                    .padding()
            }
            
            
            if viewModel.playingWord != ""{
                ScrollView{
                    ForEach(0..<7, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<4) { columnIndex in
                                let itemIndex = rowIndex * 4 + columnIndex
                                if itemIndex < viewModel.letterButtons.count {
                                    createButton(for: viewModel.letterButtons[itemIndex])
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            Spacer()
        }
    }
    
    private func createButton(for newButton: LetterButton) -> some View{
        return Button(action: {
            if newButton.state == .notSelected {
                viewModel.guess(letter: newButton)
            }
        }) {
            Text("\(newButton.letter)")
                .frame(maxWidth: 250)
                .foregroundStyle(newButton.textColor)
        }
        .buttonStyle(.bordered)
        .background(newButton.backColor)
        }
}

//#Preview {
//    ContentView()
//}
