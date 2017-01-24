//
//  ViewController.swift
//  Assignment1 (Advanced iOS Development - Calculator)
//
//  Created by Willian Campos on 2017-01-17.
//  Copyright © 2017 Camponale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    let calculator = Calculator()
    var typeInProgress = false
    
    var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let currentDigit  = sender.currentTitle!
        if (!typeInProgress) {
            displayLabel.text = currentDigit == "." ? calculator.waitingOperand ? "0" : displayLabel.text : ""
        }
        let newDisplayText = displayLabel.text! + currentDigit
        if newDisplayText != "0" {
            typeInProgress = true
        }
        if let doubleDisplay = Double(newDisplayText) {
            calculator.setOperand(operand: doubleDisplay)
            displayLabel.text = newDisplayText
        }
    }
    
    
    @IBAction func unaryOperandPressed(_ sender: UIButton) {
        calculator.doOperation(key: sender.currentTitle!)
        updateDisplay()
    }
    
    
    @IBAction func binaryOperandPressed(_ sender: UIButton) {
        calculator.doOperation(key: sender.currentTitle!)
        updateDisplay()
    }
    
    private func updateDisplay() {
        var resultString = String(calculator.result)
        if resultString == "nan" || resultString == "inf" {
            resultString = "Not a number"
        } else if resultString.hasSuffix(".0"){
            resultString = resultString.substring(to: resultString.index(resultString.endIndex, offsetBy: -2))
        }
        displayLabel.text = resultString
        typeInProgress = false
    }
    


}

