//
//  CalculatorScreenViewController.swift
//  calculator
//
//  Created by Ilya Latugovskii on 10.05.2020.
//  Copyright (c) 2020 Ilya Latugovskii. All rights reserved.
//

import UIKit

class CalculatorScreenViewController: UIViewController {
    
    @IBOutlet private weak var displayResultLabel: UILabel!
    
    private var operation = Operation()
    private var stillTyping = false
    private var firstOperand: Double = 0
    private var secondOperand: Double = 0
    private var operationSign = ""
    
    private var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            
            stillTyping = false
        }
    }
    
    //MARK: - User interaction
    
    @IBAction private func tapOnNumber(_ sender: UIButton) {
        if stillTyping {
            if displayResultLabel.text!.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + sender.titleLabel!.text!
            }
        } else {
            if sender.titleLabel?.text == "0" {
                return
            }
            displayResultLabel.text = sender.titleLabel!.text!
            stillTyping = true
        }
    }
    
    @IBAction private func tapOnOperation(_ sender: UIButton) {
        operationSign = sender.titleLabel!.text!
        firstOperand = currentInput
        stillTyping = false
    }
    
    @IBAction private func tapOnEqual(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        
        switch operationSign {
        case "÷": operateWithTwoOperand{ $0 / $1 }
        case "×": operateWithTwoOperand{ $0 * $1 }
        case "-": operateWithTwoOperand{ $0 - $1 }
        case "+": operateWithTwoOperand{ $0 + $1 }
        default: break
        }
        
    }
    
    @IBAction private func tapOnCancelButton(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        operationSign = ""
    }
    
    @IBAction private func tapDotButton(_ sender: UIButton) {
        if (displayResultLabel.text?.contains("."))! {
            return
        } else {
            displayResultLabel.text = displayResultLabel.text! + "."
            stillTyping = true
        }
    }
    
    @IBAction private func tapSqrt(_ sender: UIButton) {
        currentInput = operation.execute(operation: .sqrt, currentValue: currentInput)
    }
    
    @IBAction private func tapOnTenInExponent(_ sender: UIButton) {
        currentInput = operation.execute(operation: .tenInExponent, currentValue: currentInput)
    }
    
    @IBAction private func tapOnFactorial(_ sender: UIButton) {
        currentInput = operation.execute(operation: .factorial, currentValue: currentInput)
    }
    
    //MARK: - Supporting
    
    private func operateWithTwoOperand(operaiton: (Double, Double) -> Double) {
        currentInput = operaiton(firstOperand,secondOperand)
        stillTyping = false
    }
}
