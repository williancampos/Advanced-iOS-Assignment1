//
//  Calculator.swift
//  Assignment1
//
//  Created by Willian Campos on 2017-01-21.
//  Copyright © 2017 Camponale. All rights reserved.
//

import Foundation

class Calculator {
    
    struct BinaryOperationInfo {
        let firstOperand: Double
        let operation: (Double, Double) -> Double
    }
    
    var auxiliary = 0.0
    var binaryOperationInfo: BinaryOperationInfo?
    
    var result: Double {
        get {
            return auxiliary
        }
    }
    
    func setOperand(operand: Double) {
        auxiliary = operand
    }
    
    func doOperation(key: String) {
        switch key {
            case "AC":
                auxiliary = 0
                binaryOperationInfo = nil
            case "sin": auxiliary = sin(auxiliary)
            case "cos": auxiliary = cos(auxiliary)
            case "tan": auxiliary = tan(auxiliary)
            case "!": auxiliary = factorial(auxiliary)
            case "√": auxiliary = sqrt(auxiliary)
            case "π": auxiliary = M_PI
            case "±": auxiliary = auxiliary * -1
            case "+":
                doBinaryOperation()
                binaryOperationInfo = BinaryOperationInfo(firstOperand: auxiliary, operation: {x, y in return x + y})
            case "-":
                doBinaryOperation()
                binaryOperationInfo = BinaryOperationInfo(firstOperand: auxiliary, operation: {x, y in return x - y})
            case "×":
                doBinaryOperation()
                binaryOperationInfo = BinaryOperationInfo(firstOperand: auxiliary, operation: {x, y in return x * y})
            case "÷":
                doBinaryOperation()
                binaryOperationInfo = BinaryOperationInfo(firstOperand: auxiliary, operation: {x, y in return x / y})
            case "=":
                doBinaryOperation()
            default: break
        }
    }
    
    private func doBinaryOperation() {
        if binaryOperationInfo != nil {
            auxiliary = binaryOperationInfo!.operation(binaryOperationInfo!.firstOperand, auxiliary)
            binaryOperationInfo = nil
        }
    }
    
    
    
    private func factorial(_ number: Double) -> Double {
        var result = 1.0
        if (number > 1) {
            result = number * factorial(number - 1)
        }
        return result
    }
    
}
