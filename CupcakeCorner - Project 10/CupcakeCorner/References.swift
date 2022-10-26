//
//  References.swift
//  CupcakeCorner
//
//  Created by Eric Tolson on 10/12/22.
//

import Foundation
/*
 
 /// manually make a type with published data conform to codable
class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Paul Hudson"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}
 
 
/// retrieving data from the internet and displaying it
 struct Response: Codable {
     var results: [Result]
 }

 struct Result: Codable {
     var trackId: Int
     var trackName: String
     var collectionName: String
 }

 struct ContentView: View {
     @State private var results = [Result]()

     var body: some View {
         List(results, id: \.trackId) { item in
             VStack(alignment: .leading) {
                 Text(item.trackName)
                     .font(.headline)
                 Text(item.collectionName)
             }
         }
         .task {
             await loadData()
         }
     }
     
     func loadData() async {
         guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
             print("Invalid URL")
             return
         }
         do {
             let (data, _) = try await URLSession.shared.data(from: url)

             if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                 results = decodedResponse.results
             }
             
         } catch {
             print("Invalid data")
         }
     }
 }
 
/// loading an image from a remote server
 
 struct ContentView: View {

     var body: some View {
         /*
          
         AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)

          
         AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
             image
                 .resizable()
                 .scaledToFit()
         } placeholder: {
             Color.red
         }
         .frame(width: 200, height: 200)
          */
         
         AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
             if let image = phase.image {
                 image
                     .resizable()
                     .scaledToFit()
             } else if phase.error != nil {
                 Text("There was an error loading the image.")
             } else {
                 ProgressView()
             }
         }
         .frame(width: 200, height: 200)
     }
 }

/// disable button
 
 struct ContentView: View {
     @State private var username = ""
     @State private var email = ""
     
     var disableForm: Bool {
         username.count < 5 || email.count < 5
     }
     
     var body: some View {
         Form {
             Section {
                 TextField("Username", text: $username)
                 TextField("Email", text: $email)
             }

             Section {
                 Button("Create account") {
                     print("Creating account…")
                 }
             }
             .disabled(disableForm)

         }
     }
 }
*/

