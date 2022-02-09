//
//  MemoryGame.swift
//  Matching
//
//  Created by Matthew Wylder on 1/28/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
    
    private(set) var cards: [Card]
    private var onlySelectedIndex: Int? {
        get {
            let faceUpIndices = cards.indices.filter({cards[$0].isFaceUp})
            return faceUpIndices.count == 1 ? faceUpIndices.first : nil
        }
        set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue )} }
    }
    
    
    
    private(set) var score: Int = 0
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        var allCards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            allCards.append(Card(content: content, id: pairIndex*2))
            allCards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = allCards.shuffled()
    }

    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) else {
            fatalError("Selected a card that doesn't exist")
        }
        guard !cards[chosenIndex].isFaceUp,
              !cards[chosenIndex].isMatched else {
            print("Selected a matched or face up card")
            return
        }
        
        if let previouslySelectedIndex = onlySelectedIndex {
            if cards[chosenIndex].content == cards[previouslySelectedIndex].content {
                cards[chosenIndex].isMatched = true
                cards[previouslySelectedIndex].isMatched = true
                score += 2
            } else {
                score -= 1
            }
            cards[chosenIndex].isFaceUp = true
        } else {
            onlySelectedIndex = chosenIndex
        }
    }
    
}
