//
//  References.swift
//  GuessTheFlag
//
//  Created by Eric Tolson on 10/12/22.
//

import Foundation
/*
 ///full app
 struct FlagImage: View {
     let name: String

     var body: some View {
         Image(name)
             .renderingMode(.original)
             .clipShape(Capsule())
             .shadow(radius: 5)
     }
 }

 struct Title: ViewModifier {
     func body(content: Content) -> some View {
         content
             .font(.largeTitle)
             .foregroundColor(.blue)
             .padding()
         
     }
 }

 extension View {
     func titleStyle() -> some View {
         modifier(Title())
     }
 }

 struct ContentView: View {
     @State private var showingScore = false
     @State private var gameOver = false
     @State private var scoreTitle = ""
     @State private var score = 0
     @State private var turns = 1

     @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
     @State private var correctAnswer = Int.random(in: 0...2)
     
     
         
     
     var body: some View {
         ZStack {
             RadialGradient(stops: [
                 .init(color: Color(red: 0.1, green: 0.4, blue: 0.6), location: 0),
                 .init(color: Color(red: 0.9, green: 0.15, blue: 0.26), location: 2),
             ], center: .top, startRadius: 0, endRadius: 500)
                 .ignoresSafeArea()
             VStack {
                 Spacer()
                 Text("Guess the Flag")
                         .font(.largeTitle.weight(.bold))
                         .foregroundColor(.white)
                 
                 VStack (spacing: 15) {
                     VStack {
                             Text("Tap the flag of")
                                 .foregroundStyle(.secondary)
                                 .font(.subheadline.weight(.heavy))
                             Text(countries[correctAnswer])
                                 .font(.largeTitle.weight(.semibold))
                         
                         }
                     
                     ForEach(0..<3) { number in
                         Button {
                             flagTapped(number)
                         } label: {
                             FlagImage(name: countries[number])
                         }
                     }
                 }
                 .frame(maxWidth: .infinity)
                 .padding(.vertical, 20)
                 .background(.regularMaterial)
                 .clipShape(RoundedRectangle(cornerRadius: 20))
                 
                 Spacer()
                 Spacer()
                 
                 Text("Score: \(score)")
                     .foregroundColor(.white)
                     .font(.title.bold())
                 Spacer()
             } .padding()
             
         }

         .alert(scoreTitle, isPresented: $showingScore) {
             Button("Continue", action: askQuestion)
         }
         message: {
             Text("Your score is \(score)")
         }
         .alert(scoreTitle, isPresented: $gameOver) {
             Button("Play Again", action: reset)
         }
         message: {
             Text("Your score is \(score). Game over")
         }
     }
     
     func flagTapped(_ number: Int) {
         if number == correctAnswer {
             scoreTitle = "Correct"
             score += 1
         } else {
             scoreTitle = "Wrong! That's the flag of \(countries[number])"
         }
         
         turns += 1
         if turns < 9 {
         showingScore = true
         } else {
             gameOver = true
         }
     }
     
     func askQuestion() {
         countries.shuffle()
         correctAnswer = Int.random(in: 0...2)
     }
     
     func reset () {
         turns = 1
         score = 0
         
         countries.shuffle()
         correctAnswer = Int.random(in: 0...2)
         
     }

 }

 //// stacks n shit
 
 struct ContentView: View {
     
     var body: some View {
         VStack {
             HStack {
                 Text("First")
                 Text("Second")
                 Text("Third")
             }
             HStack {
                 Text("First")
                 Text("Second")
                 Text("Third")
             }
             HStack {
                 Text("First")
                 Text("Second")
                 Text("Third")
             }
             HStack {
                 Text("First")
                 Text("Second")
                 Text("Third")
             }
             HStack {
                 Text("First")
                 Text("Second")
                 Text("Third")
             }
         }
     }
 }
 
 /// colors and frames
 
 truct ContentView: View {
     
     var body: some View {
         ZStack {
             VStack(spacing: 0) {
                 Color.red
                 Color.blue
             }

             Text("Your content")
                 .foregroundColor(.secondary)
                 .padding(50)
                 .background(.ultraThinMaterial)
         }
         .ignoresSafeArea()
     }
 }
 
 /// gradients
 
 struct ContentView: View {
     
     var body: some View {
         /*
          LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)

          */
         
         /*RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 50, endRadius: 500)
             .ignoresSafeArea() */
         
         AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)


     }
 }
 
 /// more buttons n shit with labels
 
 struct ContentView: View {
     var body: some View {
         /*VStack {
             Button("Button 1") { }
                 .buttonStyle(.bordered)
             Button("Button 2", role: .destructive) { }
                 .buttonStyle(.bordered)
             Button("Button 3") { }
                 .buttonStyle(.borderedProminent)
                 .tint(.mint)
             Button("Button 4", role: .destructive) { }
                 .buttonStyle(.borderedProminent)
         } */
         
         VStack {
             Button {
                 print("Button was tapped")
             } label: {
                 Text("Tap me!")
                     .padding()
                     .foregroundColor(.white)
                     .background(.red)
             }
             
             Button {
                 print("Edit button was tapped")
             } label: {
                 Label("Edit", systemImage: "pencil")
             }
         }
     }
 }
 /// alerts
 
 struct ContentView: View {
     @State private var showingAlert = false

     var body: some View {
         Button("Show Alert") {
             showingAlert = true
         }
         .alert("Important message", isPresented: $showingAlert) {
             Button("Delete", role: .destructive) { }
             Button("Cancel", role: .cancel) { }
         } message: {
             Text("Please read this.")
         }
     }
 }


 */
