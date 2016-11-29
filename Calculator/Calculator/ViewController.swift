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
				display.text = textCurrentlyInDisplay	// avoid mutiple "."
			} else {
				display.text = textCurrentlyInDisplay + digit
			}
		} else {
			if digit == "." {
				display.text = "0."	// avoid "." is inputted at first
			} else {
				display.text = digit
			}
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
		if brain.isPartialResult {
			showSequence.text = brain.description + " ="
		} else {
			showSequence.text = brain.description + "..."
		}
		brain.isPartialResult = false	// reset isPartialResult
	}
	
	@IBAction private func resetAll(_ sender: UIButton) {
		display.text = "0"
		brain.clear()
		showSequence.text?.removeAll()
		userIsInTheMiddleOfTyping = false
	}
	
	@IBOutlet private weak var showSequence: UILabel!
	
}

