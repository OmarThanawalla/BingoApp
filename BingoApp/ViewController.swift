//
//  ViewController.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bingoCard = BingoCard()
    @IBOutlet weak var bingoCardView: BingoCardView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bingoCardView.setupWithBingoCard(self.bingoCard)
    }

}

