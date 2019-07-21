//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String = operand1String + digit
            return operand1String
        } else {
            operand2String = operand2String + digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        var returnString: String?
        if operand1String == "" || operand2String == "" {
            returnString = "0"
        }
        
        if operatorType?.rawValue == "÷" && operand2String == "0" {
            returnString = "Error"
        }
        
        guard let double1 = Double(operand1String) else { return nil }
        guard let double2 = Double(operand2String) else { return nil }
        
        if let operatorType = operatorType {
            switch operatorType {
                case .addition:
                        returnString = "\(double1 + double2)"
                case .subtraction:
                        returnString = "\(double1 - double2)"
                case .division:
                        returnString = "\(double1 / double2)"
                case .multiplication:
                        returnString = "\(double1 * double2)"
                }
            }
        
        if returnString == "0.0" {
            returnString = "0"
        }
        
        return returnString
    }
}
