//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Eric Tolson on 11/15/22.
//

import SwiftUI

class Favorites: ObservableObject, Codable {
    // the actual resorts the user has favorited
    private var resorts: Set<String>

    // the key we're using to read/write in UserDefaults
    private var saveKey = "Favorites"

    init() {
        // load our saved data
        if let data = UserDefaults.standard.data(forKey: "Favorites") {
            if let decoded = try? JSONDecoder().decode(Favorites.self, from: data) {
                resorts = decoded.resorts
                return
            }
        }
            // still here? Use an empty array
        resorts = []
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // write out our data
        if let encoded = try? JSONEncoder().encode(resorts) {
                UserDefaults.standard.set(encoded, forKey: "Favorites")
            }
    }
}
