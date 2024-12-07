//
//  ViewController.swift
//  Counter
//
//  Created by Ди Di on 01/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterValue: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonClean: UIButton!
    @IBOutlet weak var historyArea: UITextView!
    private var currentNumber: Int = 0
    var historyTitle = "История изменений:"
    var historyNewNote: [String] = []
    var formDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
  
 
    @IBAction func increaseButton(_ sender: UIButton) {
        currentNumber += 1
        counterValue.text = "Значение счётчика: \(currentNumber)"
        historyNewNote.append("\(formDate): значение изменено на +1")
        updatehistoryArea()
    }
    
    @IBAction func decreaseButton(_ sender: UIButton) {
        currentNumber -= 1
        if currentNumber >= 0 {
            counterValue.text = "Значение счётчика: \(currentNumber)"
            historyNewNote.append("\(formDate): значение изменено на -1")
            updatehistoryArea()
        }
        else {
            currentNumber = 0
            historyNewNote.append("\(formDate): попытка уменьшить значение счётчика ниже 0")
            updatehistoryArea()
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        currentNumber = 0
        counterValue.text = "Значение счётчика: \(currentNumber)"
//        historyNewNote.removeAll()
        historyNewNote.append("\(formDate): значение сброшено")
        updatehistoryArea()
    }
    
//    @IBAction func addHistory(_ sender: UITextField) {
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonPlus.backgroundColor = .red
        buttonPlus.layer.cornerRadius = 30
        
        buttonMinus.backgroundColor = .blue
        buttonMinus.layer.cornerRadius = 30
        
        let buttonImage = UIImage(systemName: "trash")
        buttonClean.setImage(buttonImage, for: .normal)
        historyArea.isEditable = false
        
        updatehistoryArea()

        // Do any additional setup after loading the view.
    }
    func updatehistoryArea() {
        let fullHistory = historyTitle + "\n\n" + historyNewNote.joined(separator: "\n")
        historyArea.text = fullHistory
    }
    
    
    //    func changingValue(_ sender: Any)) {
    //        if //клиент нажал на кнопку =>
    //        counterValue += 1
    //    }
}
