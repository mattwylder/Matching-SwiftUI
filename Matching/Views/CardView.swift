//
//  CardView.swift
//  Matching
//
//  Created by Matthew Wylder on 2/3/22.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(lineWidth: 5)
                Text(card.content)
            } else {
                shape.fill()
            }
        }.opacity(card.isMatched ? 0 : 1)
    }
}



//MARK: Content Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = MemoryGame<String>.Card(isFaceUp: true, isMatched: false, content: "F", id: 1)
        CardView(card: card)
            .preferredColorScheme(.dark)
    }
}
