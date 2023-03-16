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
    @IBOutlet var ButtonCollection0: [UIButton]!
    @IBOutlet var ButtonCollection1: [UIButton]!
    @IBOutlet var ButtonCollection2: [UIButton]!
    @IBOutlet var ButtonCollection3: [UIButton]!
    @IBOutlet var SV0: UIStackView!
    @IBOutlet var SV1: UIStackView!
    @IBOutlet var SV2: UIStackView!
    @IBOutlet var SV3: UIStackView!
    
    let preferences = UserDefaults.standard
    
    var level = ""
    lazy var countConstOfCards = ButtonCollection.count
    lazy var countOfCards = ButtonCollection.count
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (ButtonCollection.count + 1) / 2)
    
    var emojiCollection = ["👑", "🕸", "🐲", "⚱️", "🕌", "🤴🏽", "☠️", "🏺", "🇪🇬", "🐪", "🐘", "🗿", "🔯", "🔅", "🔆", "🐍", "🐆", "🐄", "💎", "🗝️", "💰"]
    
    var cardIcons = [UIImage(named: "Image1.png"), UIImage(named: "Image2.png"), UIImage(named: "Image3.png"), UIImage(named: "Image4.png"),UIImage(named: "Image5.png"), UIImage(named: "Image6.png"), UIImage(named: "Image7.png"), UIImage(named: "Image8.png"), UIImage(named: "Image9.png"), UIImage(named: "Image10.png")]
    
    var emojiDic = [Int:UIImage]()
    
    override func viewDidLoad() {
        points_label.text = "Points: \(preferences.string(forKey: "points") ?? "0")"

        switch(level){
        case "0":
            SV0.isHidden = false
            ButtonCollection = ButtonCollection0
            for index in ButtonCollection0.indices{
                let button = ButtonCollection0[index]
                button.layer.cornerRadius = 10}
            points_label.text = "Level 0 (Training)"

            break
        case "1":
            SV1.isHidden = false
            ButtonCollection = ButtonCollection1
            for index in ButtonCollection1.indices{
                let button = ButtonCollection1[index]
                button.layer.cornerRadius = 10}
            break
        case "2":
            SV2.isHidden = false
            ButtonCollection = ButtonCollection2
            for index in ButtonCollection2.indices{
                let button = ButtonCollection2[index]
                button.layer.cornerRadius = 10}
            break
        case "3":
            SV3.isHidden = false
            ButtonCollection = ButtonCollection3
            for index in ButtonCollection3.indices{
                let button = ButtonCollection3[index]
                button.layer.cornerRadius = 10}
            break
        default:
            break
        }
    }
        
    func emojiIdentifier(for card: Card)->UIImage{
        if emojiDic[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(cardIcons.count)))
            emojiDic[card.identifier] = cardIcons.remove(at: randomIndex)
        }
        return emojiDic[card.identifier] ?? UIImage(named: "Image1.png")!
    }
        
    func updateViewFromModel(){
            var countOfUsedCards = countConstOfCards
            var faceUpCard = 0
            for index in ButtonCollection.indices{
                let button = ButtonCollection[index]
                let card = game.cards[index]
                if card.isFaceUp{
                    faceUpCard += 1
                    let image = emojiIdentifier(for: card)
                    let scaledImage = image.withRenderingMode(.alwaysOriginal).resized(to: CGSize(width: 80, height: 80))
                    button.setImage(scaledImage, for: .normal)
                    button.contentMode = .center
                    button.backgroundColor = UIColor.clear
                    button.isHidden = false
                }
                else{
                    countOfUsedCards = card.isMatched ? (countOfUsedCards - 1) : countOfUsedCards
                    button.setImage(nil, for: .normal)
                    button.setBackgroundImage(nil, for: .normal)
                    button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.white
                }
            }
            countOfCards = countOfUsedCards
            if faceUpCard == 2, countOfCards == 2{
                for index in ButtonCollection.indices{
                    let button = ButtonCollection[index]
                    button.setTitle("", for: .normal)
                    button.backgroundColor = UIColor.clear
                }
                winAction()
            }
        }
        
    func winAction(){
        let alert = UIAlertController(title: "Congratulations!", message: "Level completed", preferredStyle: .alert)
            
        let cancel = UIAlertAction(title: "Back to menu", style: .cancel, handler: { action in
            self.dismiss(animated: true)
             })
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
        self.present(alert, animated: true)
            
        })
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if let buttonIndex = ButtonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()}
        points_label.text = "Points: \(preferences.string(forKey: "points") ?? "0")"
        }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }

        
}



