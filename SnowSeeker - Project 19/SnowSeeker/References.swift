//
//  References.swift
//  SnowSeeker
//
//  Created by Eric Tolson on 11/13/22.
//

import Foundation


/*
 /// making a list searchable
 
 struct ContentView: View {
     @State private var searchText = ""
     let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]

     var body: some View {
         NavigationView {
             List(filteredNames, id: \.self) { name in
                 Text(name)
             }
             .searchable(text: $searchText, prompt: "Look for something")
             .navigationTitle("Searching")
         }
     }

     var filteredNames: [String] {
         if searchText.isEmpty {
             return allNames
         } else {
             return allNames.filter { $0.localizedCaseInsensitiveContains(searchText) }
         }
     }
 }


 
 /// using groups as transparent layout containers
 
 struct UserView: View {
     var body: some View {
         Group {
             Text("Name: Paul")
             Text("Country: England")
             Text("Pets: Luna and Arya")
         }
         .font(.title)
     }
 }

 struct ContentView: View {
     @Environment(\.horizontalSizeClass) var sizeClass

     var body: some View {
         if sizeClass == .compact {
             VStack {
                 UserView()
             }
         } else {
             HStack {
                 UserView()
             }
         }
     }
 }

 
 /// alert and sheet with optionals
 
 import SwiftUI
 struct User: Identifiable {
     var id = "Taylor Swift"
 }

 struct ContentView: View {
     @State private var selectedUser: User? = nil
     @State private var isShowingUser = false
     
     var body: some View {
         Text("Hello, World!")
             .onTapGesture {
                 selectedUser = User()
                 isShowingUser = true
             }
             /*
             .sheet(item: $selectedUser) { user in
                 Text(user.id)
              }
             .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
                 Button(user.id) { }
              }
                 */
             .alert("Welcome", isPresented: $isShowingUser) { }
     }
 }
 
 /// multiple views side by side for big devices
 
 struct ContentView: View {
     var body: some View {
         NavigationView {
             NavigationLink {
                 Text("New secondary")
             } label: {
                 Text("Hello, World!")
             }
             .navigationTitle("Primary")

             Text("Secondary")
         }

     }
 }
 
 */
