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
                                                      cardContents: ["π", "π", "π", "π", "βοΈ", "πΆ", "π", "π", "π"],
                                                      color: .pink)
    static let greenRussian = MemoryGameTheme<String>(name: "green russian",
                                                      pairCount: 4,
                                                      cardContents: ["Ρ", "ΠΏ", "Π·", "Ρ", "ΠΉ", "Ρ", "Ρ", "Π²", "Ρ"],
                                                      color: .green)
}
