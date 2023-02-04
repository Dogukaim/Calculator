//
//  ViewController.swift
//  Calculator.
//
//  Created by Doğukan Varılmaz on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic() 
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setnumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
           
            
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result 
            }
            
            
            
        }
    }
   
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let namValue = sender.currentTitle {
         
            if isFinishedTypingNumber {
                displayLabel.text = namValue
                isFinishedTypingNumber = false
            }else {
                if namValue == "." {
                   
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + namValue
            }
        }
         
         
    }
    
}

