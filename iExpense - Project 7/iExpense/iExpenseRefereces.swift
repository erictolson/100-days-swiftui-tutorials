//
//  File.swift
//  iExpense
//
//  Created by Eric Tolson on 9/29/22.
//
/*
import SwiftUI
// using classes instead of structs to share data in different pages
class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}
struct ContentView: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
 // SHOIWING AND DISMISSING VIEWS
 struct SecondView: View {
     @Environment(\.dismiss) var dismiss

     
     let name: String
     
     var body: some View {
         Button("Dismiss") {
             dismiss()
         }
     }
 }

 struct ContentView: View {
     @State private var showingSheet = false
     
     var body: some View {
         Button("Show Sheet"){
             showingSheet.toggle()
         }
         .sheet(isPresented: $showingSheet) {
             SecondView(name: "Eric")
         }
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }
 
 //// ON DELETE FUNCTION
 
 struct ContentView: View {
     @State private var numbers = [Int]()
     @State private var currentNumber = 1
     
     var body: some View {
         NavigationView {
             VStack {
                 List {
                     ForEach(numbers, id: \.self) {
                         Text("Row \($0)")
                     }
                     .onDelete(perform: removeRows)
                 }
                 
                 Button("Add Number") {
                     numbers.append(currentNumber)
                     currentNumber += 1
                 }
             }
             .navigationTitle("onDelete()")
             .toolbar {
                 EditButton()
             }
         }
     }
     
     func removeRows(at offsets: IndexSet) {
         numbers.remove(atOffsets: offsets)
     }
 }
 
 ////Storing user settings with UserDefaults
 
 struct ContentView: View {
     @AppStorage("tapCount") private var tapCount = 0
     
     var body: some View {
         Button("Tap count: \(tapCount)") {
             tapCount += 1
         }
     }
 }

/////Archiving Swift objects with Codable

 
 struct User: Codable {
     let firstName: String
     let lastName: String
 }

 struct ContentView: View {
     @State private var user = User(firstName: "Eric", lastName: "Tolson")
     var body: some View {
         Button("Save User") {
             let encoder = JSONEncoder()
             
             if let data = try? encoder.encode(user) {
                 UserDefaults.standard.set(data, forKey: "UserData")
             }
         }
     }
 }
 
*/
