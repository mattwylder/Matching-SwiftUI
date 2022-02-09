//
//  MatchingApp.swift
//  Matching
//
//  Created by Matthew Wylder on 1/26/22.
//

import SwiftUI

@main
struct MatchingApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
