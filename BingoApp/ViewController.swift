//
//  ViewController.swift
//  BingoApp
//
//  Created by Omar Thanawalla on 5/31/17.
//  Copyright © 2017 Omar Thanawalla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numbersAvailable = [Int]()
    var numbersCalled = [Int]()
    
    @IBOutlet weak var gameBallPicker: UIPickerView!
    var bingoCard = BingoCard()
    @IBOutlet weak var bingoCardView: BingoCardView!
    @IBOutlet weak var calledNumbersLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeGameBalls()
        self.bingoCardView.setupWithBingoCard(self.bingoCard)
        self.gameBallPicker.delegate = self
        self.gameBallPicker.dataSource = self
        self.bingoCard.delegate = self
    }

    @IBAction func gameBallSelected(_ sender: Any) {
        let selectedGameBall = self.gameBallPicker.selectedRow(inComponent: 0)+1
        
        numbersCalled.append(selectedGameBall)
        self.bingoCard.markTileWithValue(selectedGameBall)
        
        updateCalledNumbersLabel()
        self.bingoCardView.reloadData()
    }
    
    @IBAction func resetGame(_ sender: Any) {
        self.bingoCard = BingoCard()
        initializeGameBalls()
        self.bingoCardView.setupWithBingoCard(self.bingoCard)
        updateCalledNumbersLabel()

    }
    
    func updateCalledNumbersLabel() {
        var calledNumbersString = ""
        for calledGameBall in numbersCalled {
            calledNumbersString = calledNumbersString + "\(calledGameBall), "
        }
        self.calledNumbersLabel.text = calledNumbersString
    }
    
    func initializeGameBalls() {
        numbersAvailable = [Int]()
        numbersCalled = [Int]()
        for number in 1...75 {
            numbersAvailable.append(number)
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return numbersAvailable.count
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
}

extension ViewController: BingoCardDelegate {
    
    func bingoCardDidWinBingo( _ bingoCard: BingoCard) {
        // Throw up alert view
        let alertController = UIAlertController(title: "Bingo!", message: "You have won Bingo", preferredStyle: UIAlertControllerStyle.alert)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

