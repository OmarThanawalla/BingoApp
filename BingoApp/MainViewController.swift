//
//  ViewController.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var bingoCard = BingoCard()
    @IBOutlet weak var bingoCardView: BingoCardView!
    @IBOutlet weak var gameBallCollectionView: GameBallCallCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bingoCardView.setupWithBingoCard(self.bingoCard)
        self.bingoCard.delegate = self
        self.gameBallCollectionView.gameBallCollectionViewDelegate = self
    }
    
    @IBAction func resetGame(_ sender: Any) {
        self.bingoCard = BingoCard()
        self.bingoCard.delegate = self
        self.bingoCardView.setupWithBingoCard(self.bingoCard)
        self.gameBallCollectionView.resetGameBalls()
    }
    
}

extension MainViewController: BingoCardDelegate {
    
    func bingoCardDidWinBingo( _ bingoCard: BingoCard) {
        // Throw up alert view
        let alertController = UIAlertController(title: "Bingo!",
                                                message: "You have won Bingo",
                                                preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "Play again", style: UIAlertActionStyle.default) { (alert: UIAlertAction) in
            self.resetGame("")
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension MainViewController: GameBallCollectionViewDelegate {
    
    func gameBallCollectionViewDidSelectGameBallTile(_ gameBall: GameBallTile) {
        self.bingoCard.markTileWithValue(gameBall.number)
        self.bingoCardView.reloadData()
    }
}






















