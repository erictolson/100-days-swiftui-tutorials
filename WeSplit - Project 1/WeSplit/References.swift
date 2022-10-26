//
//  References.swift
//  WeSplit
//
//  Created by Eric Tolson on 10/11/22.
//

import Foundation


/*
 
 \\\ full app
 struct ContentView: View {
     @State private var checkAmount = 0.0
     @State private var numberOfPeople = 2
     @State private var tipPercentage = 20
     @FocusState private var amountIsFocused: Bool
     
     let tipPercentages = [10, 15, 20, 25, 0]
     
     
     var totalCheck: Double {
         let tipSelection = Double(tipPercentage)
         let tipValue = checkAmount / 100 * tipSelection
         let grandTotal = checkAmount + tipValue
         
         return grandTotal
     }
     
     var totalPerPerson: Double {
         let peopleCount = Double(numberOfPeople + 2)
         let tipSelection = Double(tipPercentage)

         let tipValue = checkAmount / 100 * tipSelection
         let grandTotal = checkAmount + tipValue
         let amountPerPerson = grandTotal / peopleCount

         return amountPerPerson
     }
     
     var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
         .currency(code: Locale.current.currencyCode ?? "USD")
     }
     
     var body: some View {
         NavigationView {
             Form {
                 Section {
                     TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                         .keyboardType(.decimalPad)
                         .focused($amountIsFocused)
                     
                     Picker("Number of people", selection: $numberOfPeople) {
                         ForEach(2..<100) {
                             Text("\($0) People")
                         }
                     }
                 }
                 
                 Section {
                     Picker("Tip percentage", selection: $tipPercentage) {
                         ForEach(0..<101) {
                                 Text($0, format: .percent)
                             }
                         }
             
                 } header: {
                     Text("How much tip do you want to leave?")
                 }
                 
                 Section {
                     Text(totalCheck, format: currencyFormat)
                         .foregroundColor(tipPercentage == 0 ? .red : .black)
                 } header: {
                     Text("Total Amount")
                 }
                 
                 Section {
                     Text(totalPerPerson, format: currencyFormat)
                 } header: {
                     Text("Amount Per Person")
                 }
             }
             .navigationTitle("WeSplit")
             .toolbar {
                 ToolbarItemGroup(placement: .keyboard) {
                     Spacer()
                     Button("Done") {
                         amountIsFocused = false
                     }
                 }
             }

         }
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
             .previewInterfaceOrientation(.portrait)
     }
 }
 
 \\\Forms, sections, groupsl, less than 11
 
 struct ContentView: View {
     var body: some View {
         Form {
             Section {
                 Text("Fart")
                 Text("Fart")
                 Text("Fart")
                 Text("Fart")
                 Text("Fart")
                 Text("Fart")
             }
             
             Section {
                 Text("Fart")
                 Text("Fart")
                 Text("Fart")
             }
         }
     }
     
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }

 ///navigation title (protects space)
 
 struct ContentView: View {
     var body: some View {
         NavigationView{
             Form {
             Section {
                 Text("Fart")
                 Text("Fart")
                 Text("Fart")
                 Text("Fart")
                 Text("Fart")
                 Text("Fart")
             }
         }
             .navigationTitle("Shit Pig")
     }
 }
 }
 
 /// @ state
 struct ContentView: View {
     @State private var tapCount = 0
     
     var body: some View {
         Button("Tap count: \(tapCount)") {
             tapCount += 1
         }
     }
 }

///two-way binding
 
 struct ContentView: View {
     @State private var name = ""
     
     var body: some View {
         Form {
             TextField("Enter your name:", text: $name)
             Text("\(name)")
         }
     }
 }
 
 /// views in a lop
 
 struct ContentView: View {
     let students = ["Harry", "Hermione", "Ron"]
     @State private var selectedStudent = "Harry"

     var body: some View {
         NavigationView {
             Form {
                 Picker("Select your student", selection: $selectedStudent) {
                     ForEach(students, id: \.self) {
                         Text($0)
                     }
                 }
             }
         }
     }
 }
 
 ////\ reading text from the user with TextField
 
 struct ContentView: View {
     @State private var checkAmount = 0.0
     @State private var numberOfPeople = 2
     @State private var tipPercentage = 20
     
     let tipPercentages = [10, 15, 20, 25, 0]

     var body: some View {
         Form {
             Section {
                 TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                     .keyboardType(.decimalPad)
             }
             
             Section {
                     Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                 }
         }
     }
 }

 
 */

