//
//  Color+Hex.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 04.03.2024.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        
        scanner.scanHexInt64(&hexNumber)
        
        let red = Double((hexNumber & 0xff0000) >> 16) / 255.0
        let green = Double((hexNumber & 0x00ff00) >> 8) / 255.0
        let blue = Double(hexNumber & 0x0000ff) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

