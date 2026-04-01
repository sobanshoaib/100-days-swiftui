//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Soban Shoaib on 2026-03-18.
//

import SwiftUI

struct ContentView: View {
    
    @State var randomMove = Int.random(in: 0...2)
    @State var move = "Rock"
    @State var moves = ["Rock", "Paper", "Scissors"].shuffled()
    @State var showingResult = false
    @State var showingTotalResult = false
    @State var resultTitle = ""
    @State var winResult = false
    @State var points = 0
    @State var numRounds = 0
    
    var body: some View {
        VStack {
            VStack {
                Text("Computer selects...")
                Rectangle()
                    .stroke(Color.black, lineWidth: 5)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text("\(moves[randomMove])")
                    )
            }
            Rectangle()
                .fill(Color.red)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    Text("Win")
                )
                .padding()
            VStack {
                Text("Select your option:")
                HStack {
                    ForEach(moves, id: \.self) { eachMove in
                        Button {
                            clickAction(eachMove)
                        } label: {
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Text(eachMove)
                                        .foregroundStyle(.white)
                                )
                        }
                    }
                }
                
            }
        }
        .padding()
        .alert(resultTitle, isPresented: $showingResult) {
            Button("Continue") {
                if numRounds == 3 {
                    showingTotalResult = true
                }
            }
        } message: {
            Text("You have \(points) points.")
        }
        .alert("Game finished.", isPresented: $showingTotalResult) {
            Button("Retry game") {
                resetGame()
            }
        } message: {
            Text("You finished with \(points) points.")
        }
    }
    
    func clickAction(_ eachMove: String) {
        let result = gameAlgorithm(eachMove)
        if result == true {
            resultTitle = "You win this round!"
        } else {
            resultTitle = "You did not win this round."
        }

        moves.shuffle()
        randomMove = Int.random(in: 0...2)
        showingResult = true
        
    }
    
    func gameAlgorithm(_ move: String) -> Bool {
        let cpuChoice = moves[randomMove]
        
        if move == cpuChoice {
            winResult = false
        }
        
        else if move == "Rock" {
            if cpuChoice == "Paper" {
                winResult = false
            } else {
                winResult = true
            }
        }
        
        else if move == "Paper" {
            if cpuChoice == "Scissors" {
                winResult = false
            } else {
                winResult = true
            }
        }
        
        else if move == "Scissors" {
            if cpuChoice == "Rock" {
                winResult = false
            } else {
                winResult = true
            }
        }
        
        if winResult == true {
            points += 1
        } else {
            if points > 0 {
                points -= 1
            }
        }
        
        numRounds += 1
        
        return winResult
    }
    
    func resetGame() {
        points = 0
        moves.shuffle()
        randomMove = Int.random(in: 0...2)
        numRounds = 0
        
    }
    
    
}



#Preview {
    ContentView()
}
