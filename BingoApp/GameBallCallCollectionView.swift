//
//  GameBallCallCollectionView.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import UIKit

protocol GameBallCollectionViewDelegate: class {
    func gameBallCollectionViewDidSelectGameBallTile(_ gameBall: GameBallTile)
}

class GameBallCallCollectionView: UICollectionView {
    
    weak var gameBallCollectionViewDelegate: GameBallCollectionViewDelegate?
    var gameBallTiles = [GameBallTile]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    func didLoad() {
        self.delegate = self
        self.dataSource = self
        initializeGameBalls()
    }
    
    func initializeGameBalls() {
        self.gameBallTiles = [GameBallTile]()
        for number in 1...75 {
            let gameBallTile = GameBallTile(number: number)
            gameBallTiles.append(gameBallTile)
        }
    }
    
    func resetGameBalls() {
        initializeGameBalls()
        self.reloadData()
    }
}

extension GameBallCallCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameBallTiles.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameBallCollectionViewCell", for: indexPath) as! GameBallCallCollectionViewCell
        let gameBallTile = gameBallTiles[indexPath.item]
        cell.setupCellWithGameBallTile(gameBallTile)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gameBallTile = gameBallTiles[indexPath.item]
        gameBallTile.marked = true
        self.reloadData()
        if let delegate = self.gameBallCollectionViewDelegate {
            delegate.gameBallCollectionViewDidSelectGameBallTile(gameBallTile)
        }
    }
}

class GameBallCallCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    func setupCellWithGameBallTile( _ gameBallTile: GameBallTile) {
        self.numberLabel.text = "\(gameBallTile.number)"
        if gameBallTile.marked {
            self.backgroundColor = UIColor.blue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 1
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = UIColor.white
    }
}

class GameBallTile {
    var number: Int
    var marked: Bool
    
    public init(number: Int, marked: Bool = false) {
        self.number = number
        self.marked = marked
    }
}
