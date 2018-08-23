//
//  Prettifier.swift
//  LinesSorter
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

		var range = range
			.omittingFirstAndLastNewLine(in: lines)
			.saneRange(for: lines.count)

		trimWhitespaces(from: lines, in: range)

		let linesRemoved = removeBlankLinesInMiddle(lines: lines, in: range)
		range = range.lowerBound...(range.upperBound - linesRemoved)

		LinesSorter().sort(lines, in: range, by: <)

		removeDuplicates(from: lines, in: range)
	}

	private func trimWhitespaces(from lines: NSMutableArray, in range: CountableClosedRange<Int>) {
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

private extension CountableClosedRange where Bound == Int {
	func saneRange(for elementsCount: Int) -> CountableClosedRange<Bound> {
		let lowerBound = Swift.max(self.lowerBound, 0)
		let upperBound = Swift.min(self.upperBound, Swift.max(0, elementsCount - 1))
		return lowerBound...upperBound
	}

	func omittingFirstAndLastNewLine(in lines: NSMutableArray) -> CountableClosedRange<Int> {
		guard lines.count > 2,
			let first = lines.firstObject as? String,
			let last = lines.lastObject as? String else {
				return self
		}

		let lowerBound = first.trimmingCharacters(in: .newlines).isEmpty ? self.lowerBound + 1 : self.lowerBound
		let upperBound = last.trimmingCharacters(in: .newlines).isEmpty ? self.upperBound - 1 : self.upperBound

		return lowerBound...upperBound
	}
}
