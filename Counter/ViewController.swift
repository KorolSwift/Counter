//
//  ViewController.swift
//  Counter
//
//  Created by Ди Di on 01/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterValue: UILabel!
    @IBOutlet weak var button: UIButton!
    private var currentNumber: Int = 0
    @IBAction func counterButton(_ sender: UIButton) {
        currentNumber += 1
        counterValue.text = "Значение счётчика: \(currentNumber)"

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 30

        // Do any additional setup after loading the view.
    }
    
    
    //    func changingValue(_ sender: Any)) {
    //        if //клиент нажал на кнопку =>
    //        counterValue += 1
    //    }
}
