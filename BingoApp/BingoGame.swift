//
//  BingoGame.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import Foundation

public class BingoGame {
    
    var bingoCards = [BingoCard]()
    
    public init() {
        
    }
    
    public func addBingoCard( _ bingoCard: BingoCard) {
        bingoCards.append(bingoCard)
    }
    
    public func markTilesWithValue(_ value: Int) {
        bingoCards.forEach { (bingoCard: BingoCard) in
            bingoCard.markTileWithValue(value)
        }
    }
    
    /*
     public func checkForBingo() -> Bool {
     for bingoCard in bingoCards {
     if bingoCard.checkForBingo {
     return true
     }
     }
     return false
     }
     */
}
