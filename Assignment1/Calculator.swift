//
//  Calculator.swift
//  Assignment1 (Advanced iOS Development - Calculator)
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
    var waitingOperand = false
    var typeInProgress = false
    
    var result: Double {
        get {
            return auxiliary
        }
    }
    
    //This method is responsible for defining the current operand
    func setOperand(operand: Double) {
        auxiliary = operand
        waitingOperand = false
    }
    
    
    
    //This method treats the operations (=, +, -, etc)
    func doOperation(key: String) {
        switch key {
            case "AC":
                auxiliary = 0
                binaryOperationInfo = nil
                waitingOperand = false
            case "%":
                //Treatment for % operation.
                //It varies if we already have a first operand defined or not.
                if binaryOperationInfo == nil {
                    auxiliary = auxiliary / 100
                } else {
                    auxiliary = binaryOperationInfo!.firstOperand * auxiliary / 100
                }
            case "sin":
                auxiliary = sin(auxiliary)
                waitingOperand = false
            case "cos":
                auxiliary = cos(auxiliary)
                waitingOperand = false
            case "tan":
                auxiliary = tan(auxiliary)
                waitingOperand = false
            case "!":
                auxiliary = factorial(auxiliary)
                waitingOperand = false
            case "√":
                auxiliary = sqrt(auxiliary)
                waitingOperand = false
            case "π":
                auxiliary = M_PI
                waitingOperand = false
            case "±":
                auxiliary = auxiliary * -1
                waitingOperand = false
            case "+":
                doBinaryOperation()
                binaryOperationInfo = BinaryOperationInfo(firstOperand: auxiliary, operation: {x, y in return x + y})
                waitingOperand = true
            case "-":
                doBinaryOperation()
                binaryOperationInfo = BinaryOperationInfo(firstOperand: auxiliary, operation: {x, y in return x - y})
                waitingOperand = true
            case "×":
                doBinaryOperation()
                binaryOperationInfo = BinaryOperationInfo(firstOperand: auxiliary, operation: {x, y in return x * y})
                waitingOperand = true
            case "÷":
                doBinaryOperation()
                binaryOperationInfo = BinaryOperationInfo(firstOperand: auxiliary, operation: {x, y in return x / y})
                waitingOperand = true
            case "=":
                waitingOperand = false
                doBinaryOperation()
            default: break
        }
    }
    
    //Process a binary operation
    private func doBinaryOperation() {
        if binaryOperationInfo != nil && !waitingOperand {
            auxiliary = binaryOperationInfo!.operation(binaryOperationInfo!.firstOperand, auxiliary)
            binaryOperationInfo = nil
            waitingOperand = false
        }
    }
    
    
    //In house implementation for factorial calculation
    private func factorial(_ number: Double) -> Double {
        var result = 1.0
        if (number > 1) {
            result = number * factorial(number - 1)
        }
        return result
    }
    
}
