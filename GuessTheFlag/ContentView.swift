//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ryan on 17/2/23.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        VStack (spacing: 30){
            VStack {
                Text("Tap the flag of")
                Text(countries[correctAnswer])
            }
            ForEach(0..<3){ number in
                Button {
                  // Button tapped
                } label: {
                    Image(countries[number])
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
