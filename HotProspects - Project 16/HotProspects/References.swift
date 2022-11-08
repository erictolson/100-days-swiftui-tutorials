//
//  References.swift
//  HotProspects
//
//  Created by Eric Tolson on 11/4/22.
//

import Foundation

/*
 /// request usre permission and show notifications
 
 import SwiftUI
 import UserNotifications

 struct ContentView: View {

     var body: some View {
         VStack {
             Button("Request Permission") {
                 UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                     if success {
                         print("All set!")
                     } else if let error = error {
                         print(error.localizedDescription)
                     }
                 }
             }

             Button("Schedule Notification") {
                 let content = UNMutableNotificationContent()
                 content.title = "Feed the cat"
                 content.subtitle = "It looks hungry"
                 content.sound = UNNotificationSound.default

                 // show this notification five seconds from now
                 let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                 // choose a random identifier
                 let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                 // add our notification request
                 UNUserNotificationCenter.current().add(request)
             }
         }
     }
 }
 
 /// adding more swipe functionality
 
 List {
     Text("Taylor Swift")
         .swipeActions {
             Button(role: .destructive) {
                 print("Hi")
             } label: {
                 Label("Delete", systemImage: "minus.circle")
             }
         }
         .swipeActions(edge: .leading) {
             Button {
                 print("Hi")
             } label: {
                 Label("Pin", systemImage: "pin")
             }
             .tint(.orange)
         }
 }
 
 /// adding context menus
 
 struct ContentView: View {
     @State private var backgroundColor = Color.red

     var body: some View {
         VStack {
             Text("Hello, World!")
                 .padding()
                 .background(backgroundColor)

             Text("Change Color")
                 .padding()
                 .contextMenu {
                     Button(role: .destructive) {
                         backgroundColor = .red
                     } label: {
                         Label("Red", systemImage: "checkmark.circle.fill")
                     }

                     Button("Green") {
                         backgroundColor = .green
                     }

                     Button("Blue") {
                         backgroundColor = .blue
                     }
                 }
         }
     }
 }
 
 
 ///Understanding Swift’s Result type
 struct ContentView: View {
     @State private var output = ""

     var body: some View {
         Text(output)
             .task {
                 await fetchReadings()
             }
     }

     func fetchReadings() async {
         let fetchTask = Task { () -> String in
             let url = URL(string: "https://hws.dev/readings.json")!
             let (data, _) = try await URLSession.shared.data(from: url)
             let readings = try JSONDecoder().decode([Double].self, from: data)
             return "Found \(readings.count) readings"
         }
         
         let result = await fetchTask.result
         
         switch result {
             case .success(let str):
                 output = str
             case .failure(let error):
                 output = "Error: \(error.localizedDescription)"
         }
     }
 }
 
 /// Manually publishing ObservableObject changes
 
 @MainActor class DelayedUpdater: ObservableObject {
     var value = 0 {
         willSet {
             objectWillChange.send()
         }
     }

     init() {
         for i in 1...10 {
             DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                 self.value += 1
             }
         }
     }
 }

 struct ContentView: View {
     @StateObject var updater = DelayedUpdater()
     
     var body: some View {
         Text("Value is: \(updater.value)")
     }
 }
 ///tabs
 
 struct ContentView: View {
     @State private var selectedTab = "One"

     var body: some View {
         TabView(selection: $selectedTab) {
             Text("Tab 1")
                 .onTapGesture {
                     selectedTab = "Two"
                 }
                 .tabItem {
                     Label("One", systemImage: "star")
                 }
                 .tag("One")

             Text("Tab 2")
                 .tabItem {
                     Label("Two", systemImage: "circle")
                 }
                 .tag("Two")
         }
     }
 }
 
 ///sharing stuff between stuff
 
 @MainActor class User: ObservableObject {
     @Published var name = "Taylor Swift"
 }

 struct EditView: View {
     @EnvironmentObject var user: User

     var body: some View {
         TextField("Name", text: $user.name)
     }
 }

 struct DisplayView: View {
     @EnvironmentObject var user: User

     var body: some View {
         Text(user.name)
     }
 }

 struct ContentView: View {
     @StateObject var user = User()

     var body: some View {
         VStack {
             EditView()
             DisplayView()
         }
         .environmentObject(user)

     }
 }
 */
