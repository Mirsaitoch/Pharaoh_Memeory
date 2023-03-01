//
//  ConcentrationGame.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 2/28/23.
//

import Foundation

class ConcentrationGame{
    var cards = [Card]()
    
    var indexOfOneOnlyFaceUpCard:Int?

    func chooseCard(at index: Int){
        print(cards[index].isMatched)
        if !cards[index].isMatched{
            if let matchingIndex = indexOfOneOnlyFaceUpCard, matchingIndex != index{
                print("+")
                if cards[matchingIndex].identifier == cards[index].identifier{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneOnlyFaceUpCard = nil
            }
            else{
                print("-")
                for ind in cards.indices{
                    cards[ind].isFaceUp = false
                }
                cards[index].isFaceUp = true
                print(cards[index])
                indexOfOneOnlyFaceUpCard = index
            }
        }
    }
        
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
    }
    
}
