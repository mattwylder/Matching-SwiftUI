//
//  ThemeStore.swift
//  Matching
//
//  Created by Matthew Wylder on 2/2/22.
//

import Foundation

struct ThemeStore {
    
    static let pinkVehicles = MemoryGameTheme<String>(name: "pink vehicles",
                                                      pairCount: 4,
                                                      cardContents: ["🚗", "🚕", "🚌", "🚓", "✈️", "🛶", "🚁", "🚀", "🚟"],
                                                      color: .pink)
    static let greenRussian = MemoryGameTheme<String>(name: "green russian",
                                                      pairCount: 4,
                                                      cardContents: ["я", "п", "з", "ч", "й", "т", "с", "в", "ю"],
                                                      color: .green)
}
