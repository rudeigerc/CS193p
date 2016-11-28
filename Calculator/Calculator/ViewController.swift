//
//  ViewController.swift
//  Calculator
//
//  Created by Rudeiger Cheng on 2016/11/27.
//  Copyright © 2016 Rudeiger Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet private weak var display: UILabel!
	
	private var userIsInTheMiddleOfTyping = false
	
	@IBAction private func touchDigit(_ sender: UIButton) {
		let digit = sender.currentTitle!
		if userIsInTheMiddleOfTyping {
			let textCurrentlyInDisplay = display.text!
			if digit == "." && textCurrentlyInDisplay.range(of: ".") != nil {
				display.text = textCurrentlyInDisplay
			} else {
				display.text = textCurrentlyInDisplay + digit
			}
		} else {
			display.text = digit
		}
		userIsInTheMiddleOfTyping = true
	}
	
	private var displayValue: Double {
		get {
			return Double(display.text!)!
		}
		set {
			display.text = String(newValue)
		}
	}
	
	private var brain = CalculatorBrain()
	
	@IBAction private func performOperation(_ sender: UIButton) {
		if userIsInTheMiddleOfTyping {
			brain.setOperand(operand: displayValue)
			userIsInTheMiddleOfTyping = false
		}
		if let mathematicalSymbol = sender.currentTitle {
			brain.performOperation(symbol: mathematicalSymbol)
		}
		displayValue = brain.result
	}
}

