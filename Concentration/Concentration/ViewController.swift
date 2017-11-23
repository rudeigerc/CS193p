//
//  ViewController.swift
//  Concentration
//
//  Created by Yuchen Cheng on 2017/11/19.
//  Copyright © 2017年 Yuchen Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet private weak var scoreLabel: UILabel!
	
	@IBOutlet private weak var flipCountLabel: UILabel!
	
	@IBOutlet private var cardButtons: [UIButton]!
	
	@IBAction private func newGameButton(_ sender: UIButton) {
		initView()
		game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
	}
	
	@IBAction private func touchCard(_ sender: UIButton) {
		if let cardNumber = cardButtons.index(of: sender) {
			game.chooseCard(at: cardNumber)
			updateViewFromModel()
		} else {
			print("chosen card was not in cardButtons")
		}
	}
	
	private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
	
	var numberOfPairsOfCards: Int {
		return (cardButtons.count + 1) / 2
	}
	
	private func updateViewFromModel() {
		scoreLabel.text = "Score: \(game.score)"
		flipCountLabel.text = "Flips: \(game.flipCount)"
		for index in cardButtons.indices {
			let button = cardButtons[index]
			let card = game.cards[index]
			if card.isFaceUp {
				button.setTitle(emoji(for: card), for: UIControlState.normal)
				button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
			} else {
				button.setTitle("", for: UIControlState.normal)
				button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
			}
			
			if card.isMatched {
				button.isEnabled = false
			}
		}
	}

	private var emoji = [Int:String]()
	
	private func emoji(for card: Card) -> String {
		if emoji[card.identifier] == nil, game.emojiChoices.count > 0 {
			emoji[card.identifier] = game.emojiChoices.remove(at: game.emojiChoices.count.arc4random)
		}
		return emoji[card.identifier] ?? "?"
	}
	
	private func initView() {
		for button in cardButtons {
			button.setTitle("", for: UIControlState.normal)
			button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
			button.isEnabled = true
		}
		scoreLabel.text = "Score: 0"
		flipCountLabel.text = "Flips: 0"
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Int {
	var arc4random: Int {
		if self > 0 {
			return Int(arc4random_uniform(UInt32(self)))
		} else if self < 0 {
			return -Int(arc4random_uniform(UInt32(abs(self))))
		} else {
			return 0
		}
	}
}

