//
//  LinesSequenceBuilderTests.swift
//  SortLines
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest
@testable import SortLines

class LinesSequenceBuilderTests: XCTestCase {

	func test_rangeOfSequence_fullyMatchesFilter_rangeIsCorrect() {
		let lines = ["A", "A"]

		let range = try LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("A") }, from: lines)

		XCTAssertEqual(range, LinesSequenceBuilder.Range(start: 0, end: 1))
	}

	func test_rangeOfSequence_rangeAtTheEndOfSequence_rangeIsCorrect() {
		let lines = ["A", "B", "B"]

		let range = try LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("B") }, from: lines)

		XCTAssertEqual(range, LinesSequenceBuilder.Range(start: 1, end: 2))
	}

	func test_rangeOfSequence_multipleRanges_firstRangeIsSelected() {
		let lines = ["A", "A", "B", "A"]

		let range = try LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("A") }, from: lines)

		XCTAssertEqual(range, LinesSequenceBuilder.Range(start: 0, end: 1))
	}

	func test_rangeOfSequence_noRanges_resultIsNil() {
		let lines = ["A", "A"]

		let range = try LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("B") }, from: lines)

		XCTAssertNil(range)
	}

	func test_rangeOfSequence_emptyInput_resultIsNil() {
		let range = try LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("B") }, from: [])

		XCTAssertNil(range)
	}
}
