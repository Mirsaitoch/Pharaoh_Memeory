//
//  ConcentrationGame.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 2/28/23.
//

import Foundation

class ConcentrationGame{
    let preferences = UserDefaults.standard

    var cards = [Card]()
    var mm_index = [Int]()
           
    
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
        switch(preferences.string(forKey: "level")){
            case "1":
                cards = Array(repeating: Card(), count: 8)
                mm_index = Array(0...7)
                break
            case "2":
                cards = Array(repeating: Card(), count: 16)
                mm_index = Array(0...15)
                break
            case "3":
                cards = Array(repeating: Card(), count: 20)
                mm_index = Array(0...19)
                break
            default:
                break
        }
        
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
