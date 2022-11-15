//
//  Card.swift
//  Flashzilla
//
//  Created by Eric Tolson on 11/10/22.
//

import Foundation


struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who hit the most home runs?", answer: "Barry Bonds")
}
