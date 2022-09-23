//
//  Modal.swift
//  CalculatorApp
//
//  Created by Bakhtiyarov Fozilkhon on 23.09.2022.
//

import Foundation

struct Modal {
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var dotIs = false
    var displayLabel: String = ""
    var currentInput: Double{
        get{
            return Double(displayLabel)!
        }
        set{
            let value = "\(newValue)"
            let array = value.split(separator: ".")
            if array[1] == "0" {
                displayLabel = "\(array[0])"
            }else{
                displayLabel = "\(newValue)"
            }
            stillTyping = false
        }
    }
    
    mutating func digitKeyPressed(key: String){
        let number = key
        if stillTyping {
            displayLabel = displayLabel + number
        }else{
            displayLabel = number
            stillTyping = true
        }
    }
    
    mutating func operationSignPressed(signOperands: String) {
        operationSign = signOperands
        firstOperand = currentInput
        stillTyping = false
        dotIs = false
    }
    
    mutating func clearButtonPressed(){
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        stillTyping = false
        dotIs = false
        operationSign = ""
    }
    
    mutating func operateWithTwoOperands(operation: (Double , Double) -> Double){
        currentInput = operation(firstOperand , secondOperand)
        stillTyping = false
    }
    
    mutating func equalSignPressed(){
        if stillTyping {
            secondOperand = currentInput
        }
        
        dotIs = false
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "*":
            operateWithTwoOperands{$0 * $1}
        case "/":
            operateWithTwoOperands{$0 / $1}
        default:
            break
        }
    }
    
    mutating func plusMinusButtonPressed(){
        currentInput = -currentInput
    }
    
    mutating func percentageButtonPressed(){
        if firstOperand == 0 {
            currentInput = currentInput / 100
        }else{
            secondOperand = firstOperand * currentInput / 100
        }
    }
    
    mutating func squareButtonPressed(){
        currentInput = sqrt(currentInput)
    }
    
    mutating func dotButtonPressed(){
        if stillTyping && !dotIs {
            displayLabel = displayLabel + "."
            dotIs = true
        }else if !stillTyping && !dotIs{
            displayLabel = "0."
        }
    }
}
