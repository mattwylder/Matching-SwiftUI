//
//  MemoryGameTheme.swift
//  Matching
//
//  Created by Matthew Wylder on 1/31/22.
//

import Foundation


struct MemoryGameTheme<CardContent> where CardContent: Hashable {
    
    enum Color {
        case red, blue, green, orange, pink, black
    }
    
    let name: String
    let pairCount: Int
    let cardContents: Set<CardContent>
    let color: Color
    
    // This may be more readable as a function since it's different each time it's accessed
    var shuffledPairs: [CardContent] {
        let shuffledEmoji = self.cardContents.shuffled()
        return Array<CardContent>(shuffledEmoji[0..<pairCount])
    }
    
    init(name: String, pairCount: Int, cardContents: Set<CardContent>, color: Color) {
        self.pairCount = min(pairCount, cardContents.count)
        self.name = name
        self.cardContents = cardContents
        self.color = color
    }
    
    
}

