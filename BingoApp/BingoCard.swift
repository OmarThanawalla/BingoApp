//
//  BingoCard.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import Foundation

protocol BingoCardDelegate {
    func bingoCardDidWinBingo( _ bingoCard: BingoCard)
}

public class BingoCard {
    
    let storage: [[BingoTile]]
    var delegate: BingoCardDelegate?
    
    public init() {
        // Mock Bingo Card
        self.storage = [
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
                if value == bingoTile.number {
                    bingoTile.marked = true
                }
            }
        }
        checkForBingo()
    }
    
    
    func checkForBingo() {
        
        // check rows
        if rowsContainsBingo() {
            notifyDelegateOfBingo()
            return
        }
        
        // check columns
        if columnsContainsBingo() {
            notifyDelegateOfBingo()
            return
        }
        
        // check diagonals
        if diagonalsContainBingo() {
            notifyDelegateOfBingo()
            return
        }
    }
    
    func rowsContainsBingo() -> Bool {
        for row in self.storage {
            if tilesContainBingo(row) {
                return true
            }
        }
        return false
    }
    
    func columnsContainsBingo() -> Bool {
        for column in 0...storage.first!.count-1 {
            var bingoTiles = [BingoTile]()
            for row in 0...storage.count-1 {
                let bingoTile = storage[row][column]
                bingoTiles.append(bingoTile)
            }
            if tilesContainBingo(bingoTiles) {
                return true
            }
        }
        return false
    }
    
    func diagonalsContainBingo() -> Bool {
        // First diagonal
        var bingoTiles = [BingoTile]()
        for index in 0...storage.count-1 {
            let bingoTile = storage[index][index]
            bingoTiles.append(bingoTile)
        }
        if tilesContainBingo(bingoTiles) {
            return true
        }
        
        // Second diagonal
        bingoTiles = [BingoTile]()
        for index in 0...storage.count-1 {
            let bingoTile = storage[storage.count-1-index][index]
            bingoTiles.append(bingoTile)
        }
        
        if tilesContainBingo(bingoTiles) {
            return true
        }
        return false
    }
    
    func tilesContainBingo(_ tiles: [BingoTile]) -> Bool {
        for tile in tiles {
            if tile.marked == false {
                return false
            }
        }
        return true
    }
    
    func notifyDelegateOfBingo() {
        if let delegate = self.delegate {
            delegate.bingoCardDidWinBingo(self)
        }
    }
    
}


class BingoTile {
    var number: Int
    var marked: Bool
    static let FreeSpace = 0 // Official Bingo numbers are 1 - 75 as per game rules.
    
    public init(number: Int, marked: Bool = false) {
        self.number = number
        self.marked = marked
    }
}
