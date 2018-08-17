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

	func test_sort_sortsLinesUsingFilter() {
		let sorted = LinesSorter().sort(lines: ["A1", "A2", "B"], filter: { $0.contains("A") }, comparator: <)

		XCTAssertEqual(sorted, ["A1", "A2"])
	}

	func test_sort_sortsLinesUsingComparator() {
		let sorted = LinesSorter().sort(lines: ["B", "A"], filter: { _ in true }, comparator: <)

		XCTAssertEqual(sorted, ["A", "B"])
	}
}
