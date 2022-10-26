//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Eric Tolson on 9/30/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
