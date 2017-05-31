//
//  BingoCardView.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import UIKit

class BingoCardView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var bingoCard: BingoCard?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad() {
        self.delegate = self
        self.dataSource = self
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bingoCard?.storage.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bingoCard?.storage.first?.count ?? 0
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bingoTileCell", for: indexPath) as! BingoTileCollectionViewCell
        self.backgroundColor = UIColor.blue
        let bingoTile = bingoCard!.storage[indexPath.section][indexPath.item]
        
        cell.setupCellWithBingoTile(bingoTile)
        return cell
    }
    
    func setupWithBingoCard(_ bingoCard: BingoCard) {
        self.bingoCard = bingoCard
        self.reloadData()
    }

}
