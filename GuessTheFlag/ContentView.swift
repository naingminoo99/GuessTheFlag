//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ryan on 17/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var alertTitle = ""
    @State var totalScore = 0
    @State var showAlert = false
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack (spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                ForEach(0..<3){ number in
                    Button {
                        checkAnswer(number: number)
                    } label: {
                        Image(countries[number])
                            .clipShape(Capsule())
                            .shadow(radius: 5)

    
                    }
                }
            }
        }
        .alert(alertTitle,isPresented: $showAlert) {
            Button("Continue", action: nextQuestion)
        } message: {
            Text("Your Current Score is \(totalScore)")
        }
    }
    
    func checkAnswer (number : Int) -> Void {
        if number == correctAnswer {
            alertTitle = "Correct"
            totalScore += 1
        } else {
            alertTitle = "Wrong"
        }
        showAlert = true
    }
    
    func nextQuestion() -> Void {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
