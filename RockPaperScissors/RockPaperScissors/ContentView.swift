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
    @State var resultTitle = ""
    @State var winResult = false
    
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
            Button("Continue") {}
        } message: {
            Text("Soccer")
        }
    }
    
    func clickAction(_ eachMove: String) {
        move = eachMove
        if (move == moves[randomMove]) {
            resultTitle = "You win a point"
        }
        moves.shuffle()
        randomMove = Int.random(in: 0...2)
        showingResult = true
        print(move)
    }
    
//    func gameAlgorithm(move) {
//        var cpuChoice = moves[randomMove]
//        
//        if move == "Rock" && cpuChoice == "Paper" {
//            winResult = true
//        }
//    }
}



#Preview {
    ContentView()
}
