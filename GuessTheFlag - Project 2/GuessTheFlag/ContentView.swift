//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Eric Tolson on 9/9/22.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var turn = 1
    @State private var gameOver = false
    private let maxTurns = 8
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var flagNumber = -1
    

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.white)
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundColor(.white)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            
                        } label: {
                            FlagImage(country: countries[number])
                                .rotation3DEffect(.degrees(flagNumber == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .animation(.default, value: flagNumber)
                                .opacity(flagNumber == -1 || flagNumber == number ? 1.0 : 0.25)
                                .blur(radius: flagNumber == -1 || flagNumber == number ? 0 : 3)


                        }
    
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
    
                VStack {
                    Text("Score: \(userScore)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    Text("Turn: \(turn)/\(maxTurns)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                        
                    
                }
                .padding()
                Spacer()
            }
            .padding()

        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
                .foregroundColor(.white)
                .font(.title.bold())
        }
        .alert(scoreTitle, isPresented: $gameOver) {
            Button("Want to play again?", action: reset)
        } message: {
            Text("Your final score is \(userScore)")
                .foregroundColor(.white)
                .font(.title.bold())
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
            
        } else {
            scoreTitle = "Wrong! That is the flag of \(countries[number]) dummy!"
        }
        if turn == 8 {
            gameOver = true
            return
        }
        
        flagNumber = number
        showingScore = true
        turn += 1
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        flagNumber = -1

    }
    
    func reset() {
        userScore = 0
        turn = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
