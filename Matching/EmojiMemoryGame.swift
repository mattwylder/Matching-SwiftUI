//
//  EmojiMemoryGame.swift
//  Matching
//
//  Created by Matthew Wylder on 1/28/22.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {

    // MARK: - Properties
    
    @Published private var gameLogic: MemoryGame<String>
    @Published private var activeTheme: MemoryGameTheme<String> {
        didSet {
            let availableEmoji = activeTheme.shuffledPairs
            gameLogic = MemoryGame<String>(numberOfPairsOfCards: activeTheme.pairCount,
                                           createCardContent: {cardIndex in availableEmoji[cardIndex]})
        }
    }
    private var themes: [MemoryGameTheme<String>]
    
    init(theme: MemoryGameTheme<String> = ThemeStore.pinkVehicles) {
        themes = [ThemeStore.pinkVehicles, ThemeStore.greenRussian]
        activeTheme = theme
        let shuffledPairs = theme.shuffledPairs
        gameLogic = MemoryGame(numberOfPairsOfCards: theme.pairCount) { index in
            shuffledPairs[index]
        }
    }
    
    //MARK: - Computed Vars
    var cards: [MemoryGame<String>.Card] {
        gameLogic.cards
    }
    
    var score: Int {
        return gameLogic.score
    }
    
    var themeColor: SwiftUI.Color {
        switch activeTheme.color {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        case .orange: return .orange
        case .black: return .black
        case .pink: return .pink
        }
    }
    
    var themeName: String {
        return activeTheme.name
    }
    
    //MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        gameLogic.choose(card)
    }
    
    func newGame() {
        guard let randomTheme = themes.randomElement() else {
            fatalError("No random element found in theme")

        }
        self.activeTheme = randomTheme
    }
}
