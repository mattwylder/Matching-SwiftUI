//
//  EmojiMemoryGameView.swift
//  Matching
//
//  Created by Matthew Wylder on 1/26/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("\(viewModel.themeName)").font(.largeTitle)
            Text("Score: \(viewModel.score)")
            
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            Button("New Game") {
                viewModel.newGame()
            }
        }
        .foregroundColor(viewModel.themeColor)
        .padding(.horizontal)
    }
}



//MARK: Content Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let emojiMemoryGame = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: emojiMemoryGame)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(viewModel: emojiMemoryGame)
            .preferredColorScheme(.light)
    }
}
