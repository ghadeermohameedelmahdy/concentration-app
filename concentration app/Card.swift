//
//  File.swift
//  concentration app
//
//  Created by Ghadeer Elmahdy on 8/28/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import Foundation
struct Card{
    var isFaceUp = false
    var isMatched = false
    var indentifier : Int
//    init (indentifier: Int){
//        self.indentifier = indentifier
//
//    }
    static private var identifierFactory = 0
    
    static private func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.indentifier = Card.getUniqueIdentifier()
    }
  
    
}
