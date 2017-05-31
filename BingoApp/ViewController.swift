//
//  ViewController.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameBallPicker: UIPickerView!
    let bingoCard = BingoCard()
    @IBOutlet weak var bingoCardView: BingoCardView!
    @IBOutlet weak var calledNumbersLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bingoCardView.setupWithBingoCard(self.bingoCard)
        self.gameBallPicker.delegate = self
        self.gameBallPicker.dataSource = self
    }

    @IBAction func gameBallSelected(_ sender: Any) {
        self.bingoCard.markTileWithValue(self.gameBallPicker.selectedRow(inComponent: 0)+1)
        self.bingoCardView.reloadData()
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 75
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
}

