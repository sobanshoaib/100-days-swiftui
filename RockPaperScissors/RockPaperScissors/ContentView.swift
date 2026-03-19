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
    let moves = ["Rock", "Paper", "Scissors"]
    
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
                            move = eachMove
                            print(move)
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
    }
}

#Preview {
    ContentView()
}
