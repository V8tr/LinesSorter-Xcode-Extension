//
//  LinesSorterTests.swift
//  SortLinesTests
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest
@testable import SortLines

class SortLinesTests: XCTestCase {

    func test_sort_doesNotModifySortedInput() {
        let lines = NSMutableArray(array: ["A1", "A2", "B"])

		LinesSorter().sort(lines, in: 0...2, by: <)

        XCTAssertEqual(lines, ["A1", "A2", "B"])
    }

    func test_sort_sortsLinesUsingComparator() {
        let lines = NSMutableArray(array: ["B", "A"])

		LinesSorter().sort(lines, in: 0...1, by: <)

        XCTAssertEqual(lines, ["A", "B"])
    }

	func test_sort_upperBoundOutOfBounds_doesNotCrash() {
		let lines = NSMutableArray(array: [])

		LinesSorter().sort(lines, in: 0...10, by: <)

		XCTAssertEqual(lines, [])
	}

	func test_sort_lowerBoundOutOfBounds_doesNotCrash() {
		let lines = NSMutableArray(array: ["A"])

		LinesSorter().sort(lines, in: -1...0, by: <)

		XCTAssertEqual(lines, ["A"])
	}
}
