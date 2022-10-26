//
//  References.swift
//  Moonshot
//
//  Created by Eric Tolson on 10/4/22.
//

import Foundation

/*
 
/// Resizing images to fit the screen using GeometryReader
 
 struct ContentView: View {
     var body: some View {
         GeometryReader { geo in
             Image("Example")
                 .resizable()
                 .scaledToFit()
                 .frame(width: geo.size.width * 0.8, height: 300)
                 .frame(width: geo.size.width, height: geo.size.height)
         }
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }

 
 How ScrollView lets us work with scrolling data
 
 import SwiftUI

 struct CustomText: View {
     let text: String
     
     var body: some View {
         Text(text)
     }
     
     init(_ text: String) {
         print("Creating a new CustomText")
         self.text = text
     }
 }

 struct ContentView: View {
     var body: some View {
         ScrollView {
             LazyVStack(spacing: 10){
                 ForEach(0..<100) {
                     CustomText("Item \($0)")
                         .font(.title)
                 }
             }
             .frame(maxWidth: .infinity)
         }
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }
 
 Pushing new views onto the stack using NavigationLink
 
 import SwiftUI

 struct ContentView: View {
     var body: some View {
         NavigationView{
             List(0..<100) { row in
                 NavigationLink {
                     Text("Detail \(row)")
                 } label: {
                     Text("Row \(row)")
                         .padding()
                 }
                 .navigationTitle("SwiftUI")
             }
         }
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }
 
 
 ///Working with hierarchical Codable data
 
 import SwiftUI

 struct User: Codable {
     let name: String
     let address: Address
 }

 struct Address: Codable {
     let street: String
     let city: String
 }

 struct ContentView: View {
     var body: some View {
         Button("Decode JSON") {
             let input = """
             {
                 "name": "Taylor Swift",
                 "address": {
                     "street": "555, Taylor Swift Avenue",
                     "city": "Nashville"
                 }
             }
             """

             let data = Data(input.utf8)
             let decoder = JSONDecoder()
             if let user = try? decoder.decode(User.self, from: data) {
                 print(user.address.street)
             }
         }
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }

 /// How to lay out views in a scrolling grid
 
 import SwiftUI

 struct ContentView: View {
     let layout = [
         GridItem(.adaptive(minimum: 80, maximum: 120)),
     ]
     
     var body: some View {
         ScrollView {
             LazyVGrid(columns: layout) {
                 ForEach(0..<1000) {
                     Text("Item \($0)")
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

 /// grid
 
 import SwiftUI

 struct ContentView: View {
     let layout = [
         GridItem(.adaptive(minimum: 80, maximum: 120)),
     ]
     
     var body: some View {
         ScrollView {
             LazyVGrid(columns: layout) {
                 ForEach(0..<1000) {
                     Text("Item \($0)")
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
 */
