//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Eric Tolson on 11/13/22.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    @State private var searchText = ""
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @StateObject var favorites = Favorites()
    
    @State private var byAlpha = false
    @State private var byCountry = false
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                    
                    if favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                        .accessibilityLabel("This is a favorite resort")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Resorts")
            .toolbar {
                    Text("Sort By")
                    Button("Alphabetical") {
                        byAlpha = true
                        byCountry = false
                    }
                    
                    Button("Country") {
                        byCountry = true
                        byAlpha = false
                }
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            WelcomeView()
            
        }
        //.phoneOnlyStackNavigationView()
        .environmentObject(favorites)
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            if byAlpha {
                return resorts.sorted()
            } else if byCountry {
                return resorts.sorted { resort1, resort2 in
                    if resort1.country >= resort2.country {
                        return true
                    } else {
                        return false
                    }
                }
            } else {
                return resorts
            }
        } else {
            if byAlpha {
                return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }.sorted()
            } else if byCountry {
                return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }.sorted { resort1, resort2 in
                    if resort1.country >= resort2.country {
                        return true
                    } else {
                        return false
                    }
                }
            }
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
