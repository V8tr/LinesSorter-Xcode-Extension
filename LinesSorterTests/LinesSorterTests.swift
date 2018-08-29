//
//  LinesSorterTests.swift
//  LinesSorterTests
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest
@testable import LinesSorter

class LinesSorterTests: XCTestCase {

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

	func test_sort_leadingWhitespaces_sortsIgnoringWhitespaces() {
		let lines = NSMutableArray(array: ["  B", " A"])

		LinesSorter().sort(lines, in: 0...1, by: isLowerIgnoringLeadingWhitespacesAndTabs)

		XCTAssertEqual(lines, [" A", "  B"])
	}

	func test_sort_leadingTabs_sortsIgnoringTabs() {
		let lines = NSMutableArray(array: ["\tB", "\tA"])

		LinesSorter().sort(lines, in: 0...1, by: isLowerIgnoringLeadingWhitespacesAndTabs)

		XCTAssertEqual(lines, ["\tA", "\tB"])
	}

	func test_sort_leadingTabsAndWhitespaces_sortsIgnoringLeadingWhitespacesAndTabs() {
		
		let lines = NSMutableArray(array: ["C", " B", "\tA"])

		LinesSorter().sort(lines, in: 0...2, by: isLowerIgnoringLeadingWhitespacesAndTabs)

		XCTAssertEqual(lines, ["\tA", " B", "C"])
	}
}
