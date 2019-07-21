//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var outputLabel: UILabel!
    
    // MARK: - Properties
    
    var brain: CalculatorBrain?
    var previousAnswer: String?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let numberPressed = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(numberPressed)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if previousAnswer != nil {
            brain?.operand1String = previousAnswer!
            previousAnswer = nil
        }
        if let operatorPressed = sender.titleLabel?.text {
            if let operandString1 = outputLabel.text {
                brain?.operand1String = operandString1
            }
            brain?.setOperator(operatorPressed)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let result = brain?.calculateIfPossible() {
        outputLabel.text = result
        brain = CalculatorBrain()
            if outputLabel.text != "0" {
                previousAnswer = result
            } else {
                previousAnswer = nil
            }
        }
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        outputLabel.text = "0"
        previousAnswer = nil
        clearTransaction()
    }
    
    
    @IBAction func posNegButtonPressed(_ sender: Any) {
        if outputLabel.text != "0" {
            let answer = outputLabel.text
            if let doubleAnswer = Double(answer!) {
                let result = doubleAnswer * -1.0
                outputLabel.text = "\(result)"
                brain?.operand1String = "\(result)"
                brain = CalculatorBrain()
            }

        }
    }
    
    @IBAction func percentButtonPressed(_ sender: Any) {
    }
    
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
