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
		trimWhitespaces(lines: lines, in: range)
		LinesSorter().sort(lines, in: range, by: <)
		removeDuplicates(from: lines, in: range)
	}

	private func trimWhitespaces(lines: NSMutableArray, in range: CountableClosedRange<Int>) {
		for lineIndex in range where lines[lineIndex] is String {
			lines[lineIndex] = (lines[lineIndex] as! String).trimmingCharacters(in: .whitespaces)
		}
	}

	private func removeDuplicates(from lines: NSMutableArray, in range: CountableClosedRange<Int>) {
		lines
			.compactMap { $0 as? String }
			.duplicatesElementsIndices
			.forEach(lines.removeObject(at:))
	}
}
