//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Eric Tolson on 10/5/22.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.8)
    }

    static var lightBackground: Color {
        Color(red: 0.8, green: 0.2, blue: 0.3)
    }
}
