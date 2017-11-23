//
//  Concentration.swift
//  Concentration
//
//  Created by Yuchen Cheng on 2017/11/22.
//  Copyright © 2017年 Yuchen Cheng. All rights reserved.
//

import Foundation

class Concentration {
	
	private(set) var cards = [Card]()
	
	private var indexOfOneAndOnlyFaceUpCard: Int? {
		get {
			var foundIndex: Int?
			for index in cards.indices {
				if cards[index].isFaceUp {
					if foundIndex == nil {
						foundIndex = index
					} else {
						return nil
					}
				}
			}
			return foundIndex
		}
		set {
			for index in cards.indices {
				cards[index].isFaceUp = (index == newValue)
			}
		}
	}
	
	func chooseCard(at index: Int) {
		assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
			} else {
				indexOfOneAndOnlyFaceUpCard = index
			}
		}
	}
	
	init(numberOfPairsOfCards: Int) {
		assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
		for _ in 1...numberOfPairsOfCards {
			let card = Card()
			cards += [card, card]
		}
		cards.shuffle()
	}
}

extension Array {
	mutating func shuffle() {
		// Fisher–Yates shuffle
		var length = self.count
		for _ in self {
			let rand = Int(arc4random_uniform(UInt32(length)))
			if rand != length - 1 {
				self.swapAt(length - 1, rand)
			}
			length -= 1
		}
	}
}
