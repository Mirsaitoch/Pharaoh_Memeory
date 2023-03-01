//
//  GameViewController.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 2/28/23.
//

import Foundation
import UIKit

class GameViewController: UIViewController{
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (ButtonCollection.count + 1) / 2)
    
    var emojiCollection = ["👑", "🕸", "🐲", "⚱️", "🕌", "🤴🏽", "☠️", "🏺"]
    var emojiDic = [Int:String]()
    
    func emojiIdentifier(for card: Card)->String{
        if emojiDic[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDic[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDic[card.identifier] ?? "?"
    }
    
//    @IBOutlet var ButtonCollection: [UIButton]!
    
    func updateViewFromModel(){
        for index in ButtonCollection.indices{
            let button = ButtonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp{
                print("if")
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            }
            else{
//                print("else")
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.white : UIColor.systemBlue
            }
            
        }
    }
    
    @IBOutlet var ButtonCollection: [UIButton]!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        print("action")
        if let buttonIndex = ButtonCollection.firstIndex(of: sender){
            print(buttonIndex)
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
        
    }

}

