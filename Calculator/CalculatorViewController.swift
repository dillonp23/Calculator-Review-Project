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
        if let operatorPressed = sender.titleLabel?.text {
            brain?.setOperator(operatorPressed)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let result = brain?.calculateIfPossible() {
        outputLabel.text = result
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
