//
//  ViewController.swift
//  concentration app
//
//  Created by Ghadeer Elmahdy on 8/15/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  private lazy var game = concenterate(numberOfPairsOfCards:countPairs) // or count+1
    private var countPairs :Int {
        return (cardButtons.count)/2
        
    }
   private(set) var flipcount = 0
    {
        didSet{
            countlbl.text = "Flip count:\(flipcount)"
        }
    }
    @IBOutlet var countlbl: UILabel!
    
    
  @IBOutlet  private var cardButtons: [UIButton]!
    @IBAction private func card(_ sender: UIButton) {
            flipcount += 1
        if let cardnumber = cardButtons.index(of: sender)
            {
                game.chosseCard(at: cardnumber)
              
                updateViewFromModel()
//                game.shuffleTheCards()
              
//                flipcard(emojis[cardnumber],sender );
        }else{
            
            print("choose card isn't in the cardButtons")
        }
        
    }
  private  func updateViewFromModel(){
        for index in cardButtons.indices {
            let btn = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                btn.setTitle(emoji(for : card), for: UIControlState.normal)
                btn.backgroundColor = UIColor(red:1.0,green:1.0,blue:1.0,alpha:1)
            }else{
                btn.setTitle("", for: UIControlState.normal)
                btn.backgroundColor = card.isMatched ? UIColor(red:1.0,green:0,blue:0,alpha:0) : UIColor(red:1.0,green:0,blue:0,alpha:1)
            }
        }
        
    }

//    func flipcard( _ emoji:String,_ btn :UIButton) {
//        if btn.currentTitle == emoji
//
//        {
//
//        }else{
//
//
//        }
//    }
   private var emoji = [Int:String]()
   private var emojis = ["🐥","🌻","👄", "👅","👂", "👃", "👣", "👁", "👀" ,"🧠", "🗣" ]
    private func emoji(for card : Card) -> String {
        if emoji[card.indentifier] == nil , emojis.count > 0 {
            emoji[card.indentifier] = emojis.remove(at: emojis.count.arch4random) // func to return the element and then remove it from the array
            
        }
        return emoji[card.indentifier] ?? "?"
//law heya m4 == nil hayrg3 its value law == nil hatrg3 el other value
//        if  emoji[card.indentifier] != nil {
//           return emoji[card.indentifier]!
//        }else {
//            return "?"
//        }
    }
 
}
extension Int {
    var arch4random : Int{
        switch self {
        case 0...Int.max:
            return Int(arc4random_uniform(UInt32(self)))
        case -Int.max..<0 :
            return Int(arc4random_uniform(UInt32(abs(self))))
        default:
         return 0
        }
        
    }
    
    
    
}


