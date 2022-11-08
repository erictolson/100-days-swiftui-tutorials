//
//  References.swift
//  BucketList
//
//  Created by Eric Tolson on 10/30/22.
//


/*
 ///making a struct Comparable
 
 struct User: Identifiable, Comparable {
     let id = UUID()
     let firstName: String
     let lastName: String

     static func <(lhs: User, rhs: User) -> Bool {
         lhs.lastName < rhs.lastName
     }
 }

 struct ContentView: View {
     let users = [
         User(firstName: "Arnold", lastName: "Rimmer"),
         User(firstName: "Kristine", lastName: "Kochanski"),
         User(firstName: "David", lastName: "Lister"),
     ].sorted()

     var body: some View {
         List(users) { user in
             Text("\(user.lastName), \(user.firstName)")
         }
     }
 }
 
 ///saving to local file system
 
 struct ContentView: View {
     var body: some View {
         Text("Hello World")
             .onTapGesture {
                 let str = "Test Message"
                 let url = getDocumentsDirectory().appendingPathComponent("message.txt")

                 do {
                     try str.write(to: url, atomically: true, encoding: .utf8)
                     let input = try String(contentsOf: url)
                     print(input)
                 } catch {
                     print(error.localizedDescription)
                 }
             }
     }
     
     func getDocumentsDirectory() -> URL {
         // find all possible documents directories for this user
         let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

         // just send back the first one, which ought to be the only one
         return paths[0]
     }
 }

/// using enum's to change views
 
 enum LoadingState {
     case loading, success, failed
 }

 struct LoadingView: View {
     var body: some View {
         Text("Loading...")
     }
 }

 struct SuccessView: View {
     var body: some View {
         Text("Success!")
     }
 }

 struct FailedView: View {
     var body: some View {
         Text("Failed.")
     }
 }

 struct ContentView: View {
     var loadingState = LoadingState.loading
     
     var body: some View {
         if loadingState == .loading {
             LoadingView()
         } else if loadingState == .success {
             SuccessView()
         } else if loadingState == .failed {
             FailedView()
         }
     }
 }
 
 /// maps! shows pins on a map of london that you can click on

 
 import MapKit
 import SwiftUI

 struct Location: Identifiable {
     let id = UUID()
     let name: String
     let coordinate: CLLocationCoordinate2D
 }

 struct ContentView: View {
     @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
     
     let locations = [
         Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
         Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
     ]

     var body: some View {
         NavigationView {
             Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                 MapAnnotation(coordinate: location.coordinate) {
                     NavigationLink {
                         Text(location.name)
                     } label: {
                         Circle()
                             .stroke(.red, lineWidth: 3)
                             .frame(width: 44, height: 44)
                     }
                 }
             }
             .navigationTitle("London Explorer")
         }
     }
 }
 */
