//
//  ConcentrationGame.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 2/28/23.
//

import Foundation

class ConcentrationGame{
    var cards = Array(repeating: Card(), count: 16)
    
    var mm_index = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    
    let preferences = UserDefaults.standard
    
    var indexOfOneOnlyFaceUpCard:Int?

    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchingIndex = indexOfOneOnlyFaceUpCard, matchingIndex != index{
                if cards[matchingIndex].identifier == cards[index].identifier{
                    preferences.set(preferences.integer(forKey: "points")+10, forKey: "points")
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneOnlyFaceUpCard = nil
            }
            else{
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
            let randomIndexFirst = Int(arc4random_uniform(UInt32(mm_index.count - 1)))
            let freeIndexFirst = mm_index[randomIndexFirst]
            cards.remove(at: freeIndexFirst)
            cards.insert(card, at: freeIndexFirst)
            mm_index.remove(at: randomIndexFirst)
            print(mm_index)
            let randomIndexSecond = Int(arc4random_uniform(UInt32(mm_index.count - 1)))
            let freeIndexSecond = mm_index[randomIndexSecond]
            cards.remove(at: freeIndexSecond)
            cards.insert(card, at: freeIndexSecond)
            mm_index.remove(at: randomIndexSecond)
            print(mm_index)

        }
    }
    
}
