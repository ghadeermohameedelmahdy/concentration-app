//
//  concentration.swift
//  concentration app
//
//  Created by Ghadeer Elmahdy on 9/1/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import Foundation
class concenterate {
  private(set)  var  cards = Array<Card>()      //[Card]()
   private var indexOfOneAndOnlyFaceUpCard : Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp  {
                    guard foundIndex == nil else { return nil }
                    foundIndex = index
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
        
        
    }
    //el func de kant maktoba before en elcards disappear if they're matched
//    func chosseCard(at index: Int){
//
//        if  cards[index].isFaceUp {
//             cards[index].isFaceUp = false
//        }else{
//             cards[index].isFaceUp = true
//        }
//}
 func chosseCard(at index: Int){
    assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) : Choosen index out of range")
        if(!cards[index].isMatched){ //the first value of ismatched is false then al this is true
            //indexOfOneAndOnlyFaceUpCard 34an a40f had5ol el if wla el else
            // maynf34 ady value nil le el variable matchIndex 34an keda hayd5l el else el awl 
        if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index { //el4art eltany 34an law e5tart nafs el card el 2abloh
            print(matchIndex)
            if cards[matchIndex].indentifier == cards[index].indentifier {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFaceUp = true
//            indexOfOneAndOnlyFaceUpCard = nil
        }else{  // de 7alet el nil bta3t indexOfOneAndOnlyFaceUpCard
            // either no cards or 2 cards are face up
//            for flipDownCards in cards.indices {     // else hattnfz lma click on the first card
//                cards[flipDownCards].isFaceUp = false
//            }
//              cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
            }
        
    }
    }

    
    init(numberOfPairsOfCards : Int ){
            assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)) : You must have at least one pair of cards")
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]  //2 different cards added to the array but the same identifier
            // let matchedCard = card  or by using append
        }
    }
    func shuffleTheCards(){
        for i in 0..<cards.count {
            let changeIndex = i.arch4random
            let temp = cards[i]
            cards[i] = cards[changeIndex]
            cards[changeIndex] = temp
    }
    }
}
