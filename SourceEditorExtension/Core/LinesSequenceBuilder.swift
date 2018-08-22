//
//  LinesSequenceBuilder.swift
//  SortLines
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

struct LinesSequenceBuilder {

	func rangeOfSequence(
		matching isMatching: (String) -> Bool,
		ignoreWhenInMiddle isIgnored: @escaping (String) -> Bool = { _ in false },
		from lines: [String]
		) -> CountableClosedRange<Int>? {

		var start: Int?
		var end: Int?

		let isInTheMiddleAndShouldBeIgnored = { (index: Int, line: String) in
			return index > 0 && index < lines.count - 1 && isIgnored(line)
		}

		for (index, line) in lines.enumerated() {
			if isMatching(line) || isInTheMiddleAndShouldBeIgnored(index, line) {
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
			return start...end
		} else {
			return nil
		}
	}
}
