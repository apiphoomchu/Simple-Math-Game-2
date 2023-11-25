//
//  ContentView.swift
//  Simple Math Game
//
//  Created by Apiphoom Chuenchompoo on 25/11/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number1 = Int.random(in: 1...10) // 2
    @State private var number2 = Int.random(in: 1...10) // 3
    
    @State private var userAnswer: String = ""
    @State private var score: Int = 0
    @State private var totalAnswer: Int = 0
    @State private var showGameOverAlert: Bool = false

    var correctAnswer: Int {
        return number1 * number2 // 6
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Score: \(score)")
                .font(.headline)
            
            Text("Answer: \(totalAnswer)")
                .font(.headline)
            
            Text("Guess the answer:")
            
            Text("\(number1) × \(number2) = ?")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            TextField("Your answer", text: $userAnswer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            
            Button("Check Answer"){
                if let userInt = Int(userAnswer), userInt == correctAnswer {
                    score += 10
                    totalAnswer += 1
                    nextProblem()
                }else{
                    showGameOverAlert = true
                }
            }
            .padding()
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(8)
            
        }
        .padding()
        .alert(isPresented: $showGameOverAlert, content: {
            Alert(title: Text("Game Over"),
                  message: Text("Your total score is \(score) and you answer \(totalAnswer) questions. Do you want to play again?"),
                  primaryButton: .default(Text("Yes"), action: startNewGame),
                  secondaryButton: .cancel(Text("No")))
        })
    }
    
    func nextProblem(){
        number1 = Int.random(in: 1...10)
        number2 = Int.random(in: 1...10)
        userAnswer = ""
    }
    
    func startNewGame(){
        score = 0
        totalAnswer = 0
        nextProblem()
    }
    
}

#Preview {
    ContentView()
}
