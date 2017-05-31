//
//  BingoCard.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import Foundation


public class BingoCard {
    
    let storage: [[BingoTile]]
    
    public init() {
        // Mock Bingo Card
        self.storage =
        [
                [BingoTile(number: 3),BingoTile(number: 29), BingoTile(number: 45),BingoTile(number: 56),BingoTile(number: 68)],
                [BingoTile(number: 1),BingoTile(number: 19), BingoTile(number: 43),BingoTile(number: 50),BingoTile(number: 72)],
                [BingoTile(number: 11),BingoTile(number: 25), BingoTile(number: BingoTile.FreeSpace, marked: true),BingoTile(number: 49),BingoTile(number: 61)],
                [BingoTile(number: 9),BingoTile(number: 23), BingoTile(number: 31),BingoTile(number: 58),BingoTile(number: 63)],
                [BingoTile(number: 4),BingoTile(number: 27), BingoTile(number: 42),BingoTile(number: 54),BingoTile(number: 71)],
        ]
    }
    
    public func markTileWithValue(_ value: Int) {
        for row in self.storage {
            for bingoTile in row {
                bingoTile.marked = bingoTile.number == value
            }
        }
    }
    
    /*
     public func checkForBingo() -> Bool {
     // check rows
     for row in self.storage {
     
     for bingoTile in row {
     if bingoTile.marked == false {
     break
     } else {
     // if last element and true this row is the winner
     }
     }
     
     }
     
     // check columns
     // check diagonals
     }
     */
    
}


class BingoTile {
    var number: Int
    var marked: Bool
    static let FreeSpace = 0 // Official Bingo numbers are 1 - 75
    
    public init(number: Int, marked: Bool = false) {
        self.number = number
        self.marked = marked
    }
}
