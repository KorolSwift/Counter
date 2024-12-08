//
//  ViewController.swift
//  Counter
//
//  Created by Ди Di on 01/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterValueLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var cleanButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    private var currentNumber: Int = 0
    private var historyTitle = "История изменений:"
    private var historyNewNote: [String] = []
    private var formDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
  
    @IBAction private func increaseButton(_ sender: UIButton) {
        currentNumber += 1
        counterValueLabel.text = "Значение счётчика: \(currentNumber)"
        historyNewNote.append("\(formDate): значение изменено на +1")
        updatehistoryArea()
    }
    
    @IBAction private func decreaseButton(_ sender: UIButton) {
        currentNumber -= 1
        if currentNumber >= 0 {
            counterValueLabel.text = "Значение счётчика: \(currentNumber)"
            historyNewNote.append("\(formDate): значение изменено на -1")
            updatehistoryArea()
        }
        else {
            currentNumber = 0
            historyNewNote.append("\(formDate): попытка уменьшить значение счётчика ниже 0")
            updatehistoryArea()
        }
    }
    
    @IBAction private func clearButton(_ sender: UIButton) {
        currentNumber = 0
        counterValueLabel.text = "Значение счётчика: \(currentNumber)"
        historyNewNote.append("\(formDate): значение сброшено")
        updatehistoryArea()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plusButton.backgroundColor = .red
        plusButton.layer.cornerRadius = 30
        
        minusButton.backgroundColor = .blue
        minusButton.layer.cornerRadius = 30
        
        let buttonImage = UIImage(systemName: "trash")
        cleanButton.setImage(buttonImage, for: .normal)
        historyTextView.isEditable = false
        
        updatehistoryArea()
    }
    private func updatehistoryArea() {
        let fullHistory = historyTitle + "\n\n" + historyNewNote.joined(separator: "\n")
        historyTextView.text = fullHistory
    }

}
