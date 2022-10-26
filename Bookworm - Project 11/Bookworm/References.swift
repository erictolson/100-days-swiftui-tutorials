//
//  References.swift
//  Bookworm
//
//  Created by Eric Tolson on 10/16/22.
//

//import Foundation


/*
 /// multi line text
 
 struct ContentView: View {
     @AppStorage("notes") private var notes = ""

     var body: some View {
         NavigationView {
             TextEditor(text: $notes)
                 .navigationTitle("Notes")
                 .padding()
         }
     }
 }
 
 
 /// binding to a different view
 
 Struct PushButton: View {
     let title: String
     @Binding var isOn: Bool

     var onColors = [Color.red, Color.yellow]
     var offColors = [Color(white: 0.6), Color(white: 0.4)]

     var body: some View {
         Button(title) {
             isOn.toggle()
         }
         .padding()
         .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
         .foregroundColor(.white)
         .clipShape(Capsule())
         .shadow(radius: isOn ? 0 : 5)
     }
 }


 struct ContentView: View {
     @State private var rememberMe = false

     var body: some View {
         VStack {
             PushButton(title: "Remember Me", isOn: $rememberMe)
             Text(rememberMe ? "On" : "Off")
         }
     }
 }
 */
