//
//  LinesSequenceBuilder.swift
//  SortLines
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

struct LinesSequenceBuilder {

	struct Range: Equatable {
		let start: Int
		let end: Int
	}

	func rangeOfSequence(matching isMatching: (String) -> Bool, from lines: [String]) -> Range? {
		var start: Int?
		var end: Int?

		for (index, line) in lines.enumerated() {
			if isMatching(line) {
				if start == nil {
					start = index
					end = index
				} else {
					end = index
				}
			} else if start != nil && end != nil {
				break
			}
		}

		if let start = start, let end = end {
			return Range(start: start, end: end)
		} else {
			return nil
		}
	}
}
