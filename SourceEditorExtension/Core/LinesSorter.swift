//
//  LinesSorter.swift
//  SortLines
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

struct LinesSorter {

	func sort(_ inputLines: NSMutableArray, in range: CountableClosedRange<Int>, by comparator: (String, String) -> Bool) {
		guard range.upperBound < inputLines.count, range.lowerBound >= 0 else {
			return
		}

        let lines = inputLines.compactMap { $0 as? String }
        let sorted = Array(lines[range]).sorted(by: comparator)
        
        for lineIndex in range {
            inputLines[lineIndex] = sorted[lineIndex - range.lowerBound]
        }
	}
}
