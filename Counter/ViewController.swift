//
//  ViewController.swift
//  Counter
//
//  Created by Оксана Аралина on 15.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var changeHistoryTextView: UITextView!
    
    @IBOutlet weak var eraseButton: UIButton!
    private var tapsCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "\(tapsCount)"
        counterLabel.textAlignment = .center
        counterLabel.textColor = .darkGray
        counterLabel.font = .boldSystemFont(ofSize: 25)
        changeHistoryTextView.isEditable = false
        changeHistoryTextView.text = "История изменений:\n"
    }
    func addHistoryNote(_ note: String) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: currentDate)
        changeHistoryTextView.text += "\n[\(dateString)]: \(note)"
    }
    
    @IBAction func plusButtonDidTap(_ sender: Any) {
        tapsCount += 1
        counterLabel.text = "Значение счетчика: \(tapsCount)"
        addHistoryNote("значение изменено на +1")
    }
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if tapsCount == 0 {
            addHistoryNote("попытка уменьшить значение счетчика ниже 0")
        } else if tapsCount == 1 {
            tapsCount -= 1
            counterLabel.text = "\(tapsCount)"
            addHistoryNote("значение изменено на -1")
        } else {
            tapsCount -= 1
            counterLabel.text = "Значение счетчика: \(tapsCount)"
            addHistoryNote("значение изменено на -1")
        }
    }
    
    @IBAction func eraseButtonDidTap(_ sender: Any) {
        tapsCount = 0
        counterLabel.text = "\(tapsCount)"
        addHistoryNote("значение сброшено")
    }
}
