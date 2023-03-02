//
//  GameViewController.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 2/28/23.
//

import Foundation
import UIKit

class GameViewController: UIViewController{
    
    @IBOutlet var points_label: UILabel!
    var ButtonCollection = [UIButton]()
    @IBOutlet var ButtonCollection1: [UIButton]!
    @IBOutlet var ButtonCollection2: [UIButton]!
    @IBOutlet var ButtonCollection3: [UIButton]!
    @IBOutlet var SV1: UIStackView!
    @IBOutlet var SV2: UIStackView!
    @IBOutlet var SV3: UIStackView!
    
    var level = ""

    let preferences = UserDefaults.standard
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (ButtonCollection.count + 1) / 2)
    var emojiCollection = ["👑", "🕸", "🐲", "⚱️", "🕌", "🤴🏽", "☠️", "🏺", "🇪🇬", "🐪", "🐘", "🗿", "🔯", "🔅", "🔆", "🐍", "🐆", "🐄", "💎", "🗝️", "💰"]
    
    var emojiDic = [Int:String]()
    
    override func viewDidLoad() {
        
        switch(level){
        case "1":
            SV1.isHidden = false
            ButtonCollection = ButtonCollection1
            break
        case "2":
            SV2.isHidden = false
            ButtonCollection = ButtonCollection2
            break
        case "3":
            SV3.isHidden = false
            ButtonCollection = ButtonCollection3
            break
        default:
            break
        }
        
        points_label.text = "Points: \(preferences.string(forKey: "points") ?? "0")"
                
        for index in ButtonCollection1.indices{
            let button = ButtonCollection1[index]
            button.layer.cornerRadius = 10}
        
        for index in ButtonCollection2.indices{
            let button = ButtonCollection2[index]
            button.layer.cornerRadius = 10}
        
        for index in ButtonCollection3.indices{
            let button = ButtonCollection3[index]
            button.layer.cornerRadius = 10}
    }
    
        
        func emojiIdentifier(for card: Card)->String{
            if emojiDic[card.identifier] == nil{
                let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
                emojiDic[card.identifier] = emojiCollection.remove(at: randomIndex)
            }
            return emojiDic[card.identifier] ?? "?"
        }
        
        func updateViewFromModel(){
            for index in ButtonCollection.indices{
                let button = ButtonCollection[index]
                let card = game.cards[index]
                if card.isFaceUp{
                    button.backgroundColor = UIColor.white
                    button.setTitle(emojiIdentifier(for: card), for: .normal)
                    button.isHidden = false
                }
                else{
                    button.setTitle("", for: .normal)
                    button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.white
                }
            }
        }
        
        @IBAction func buttonAction(_ sender: UIButton) {
            print("action")
            if let buttonIndex = ButtonCollection.firstIndex(of: sender){
                print(buttonIndex)
                game.chooseCard(at: buttonIndex)
                updateViewFromModel()
            }
            points_label.text = "Points: \(preferences.string(forKey: "points") ?? "0")"
        }
    
        @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }

        
}

