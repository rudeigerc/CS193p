//
//  Card.swift
//  Concentration
//
//  Created by Yuchen Cheng on 2017/11/22.
//  Copyright © 2017年 Yuchen Cheng. All rights reserved.
//

import Foundation

struct Card {
	var isFaceUp = false
	var isMatched = false
	var identifier: Int
	
	private static var identifierFactory = 0
	
	private static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return identifierFactory
	}
	
	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
}
