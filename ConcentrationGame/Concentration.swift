//
//  Concentration.swift
//  Concentration
//
//  Created by Benjamin Dirgo on 5/18/20.
//  Copyright © 2020 Benjamin Dirgo. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAnOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAnOnlyFaceUpCard, matchIndex != index {
//                check if the two cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAnOnlyFaceUpCard = nil
            } else {
//                either no cards or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAnOnlyFaceUpCard = index 
            }
        }
    }
    
    func newGame() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
//        TODO: Shuffle Cards
    }
}
