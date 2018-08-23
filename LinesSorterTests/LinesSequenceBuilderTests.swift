//
//  LinesSequenceBuilderTests.swift
//  LinesSorter
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest
@testable import LinesSorter

class LinesSequenceBuilderTests: XCTestCase {

	func test_rangeOfSequence_fullyMatchesFilter_rangeIsCorrect() {
		let lines = ["A", "A"]

		let range = LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("A") }, from: lines)

		XCTAssertEqual(range, 0...1)
	}

	func test_rangeOfSequence_rangeAtTheEndOfSequence_rangeIsCorrect() {
		let lines = ["A", "B", "B"]

		let range = LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("B") }, from: lines)

		XCTAssertEqual(range, 1...2)
	}

	func test_rangeOfSequence_multipleRanges_firstRangeIsSelected() {
		let lines = ["A", "A", "B", "A"]

		let range = LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("A") }, from: lines)

		XCTAssertEqual(range, 0...1)
	}

	func test_rangeOfSequence_noRanges_resultIsNil() {
		let lines = ["A", "A"]

		let range = LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("B") }, from: lines)

		XCTAssertNil(range)
	}

	func test_rangeOfSequence_emptyInput_resultIsNil() {
		let range = LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("A") }, from: [])

		XCTAssertNil(range)
	}

	func test_rangeOfSequence_singleMatchingElement_rangeIsCorrect() {
		let range = LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("A") }, from: ["A"])

		XCTAssertEqual(range, 0...0)
	}

	func test_rangeOfSequence_appliesIgnoreWhenInMiddleFilter() {
		let range = LinesSequenceBuilder().rangeOfSequence(
			matching: { $0.contains("A") },
			ignoreWhenInMiddle: { $0.contains(" ") },
			from: ["A", " ", "A"]
		)

		XCTAssertEqual(range, 0...2)
	}

	func test_rangeOfSequence_leadingAndTrailingNewLines() {
		let lines = ["\n", "A", "A", "\n"]

		let range = LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("A") }, from: lines)

		XCTAssertEqual(range, 1...2)
	}
}
