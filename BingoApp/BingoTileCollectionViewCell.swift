//
//  BingoTileCollectionViewCell.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import UIKit

class BingoTileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    func setupCellWithBingoTile( _ bingoTile: BingoTile) {
        self.numberLabel.text = (bingoTile.number > 0) ? "\(bingoTile.number)" : "FREE SPACE"
    }
}
