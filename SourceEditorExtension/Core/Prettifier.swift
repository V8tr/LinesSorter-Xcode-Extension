//
//  Prettifier.swift
//  SortLines
//
//  Created by Vadim Bulavin on 8/21/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

struct Prettifier {

	func prettify(_ lines: NSMutableArray, in range: CountableClosedRange<Int>) {
		guard range.upperBound > 0 else {
			return
		}

		var range = saneRange(lines, range)

		trimWhitespaces(lines: lines, in: range)

		let linesRemoved = removeBlankLinesInMiddle(lines: lines, in: range)
		range = range.lowerBound...(range.upperBound - linesRemoved)

		LinesSorter().sort(lines, in: range, by: <)
		removeDuplicates(from: lines, in: range)
	}

	private func saneRange(_ lines: NSMutableArray, _ range: CountableClosedRange<Int>) -> CountableClosedRange<Int> {
		let lowerBound = max(range.lowerBound, 0)
		let upperBound = min(range.upperBound, max(0, lines.count - 1))
		return lowerBound...upperBound
	}

	private func trimWhitespaces(lines: NSMutableArray, in range: CountableClosedRange<Int>) {
		for lineIndex in range where lines[lineIndex] is String {
			lines[lineIndex] = (lines[lineIndex] as! String).trimmingCharacters(in: .whitespaces)
		}
	}

	private func removeBlankLinesInMiddle(lines: NSMutableArray, in range: CountableClosedRange<Int>) -> Int {
		let range = NSRange(range)
		let subarray = lines.subarray(with: range) as? [String] ?? []
		let countBeforeRemoval = lines.count

		let filteredObjects = subarray
			.enumerated()
			.filter { index, line in index == 0 || index == subarray.count - 1 || !line.isBlank }
			.map { $1 }

		lines.replaceObjects(in: range, withObjectsFrom: filteredObjects)

		return countBeforeRemoval - lines.count
	}

	private func removeDuplicates(from lines: NSMutableArray, in range: CountableClosedRange<Int>) {
		let range = NSRange(range)
		let subarray = lines.subarray(with: range) as? [AnyHashable] ?? []
		subarray
			.duplicatedElementsIndices
			.map { $0 + range.lowerBound }
			.forEach(lines.removeObject(at:))
	}
}
