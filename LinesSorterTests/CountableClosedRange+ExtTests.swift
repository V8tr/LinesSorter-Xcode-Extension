//
//  CountableClosedRange+ExtTests.swift
//  LinesSorterTests
//
//  Created by Vadym Bulavin on 8/23/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest

class CountableClosedRange_ExtTests: XCTestCase {

    func test_saneRange() {
		XCTAssertEqual((0...1).saneRange(for: 10), 0...1)

		XCTAssertEqual((0...1).saneRange(for: 1), 0...0)
    }

    func test_omittingFirstAndLastNewLine() {
		let array = NSMutableArray(array: ["\n", "A", "\n"])
		
		XCTAssertEqual((0...2).omittingFirstAndLastNewLine(in: array), 1...1)
    }

	func test_omittingFirstAndLastNewLine_lastNewLineOutsideOfRange_lastLineIgnored() {
		let array = NSMutableArray(array: ["\n", "A", "A"])

		XCTAssertEqual((0...1).omittingFirstAndLastNewLine(in: array), 1...1)
	}

	func test_omittingFirstAndLastNewLine_twoLeadingNewLines_secondNewLineConsidered() {
		let array = NSMutableArray(array: ["\n", "\n", "A", "A"])

		XCTAssertEqual((0...3).omittingFirstAndLastNewLine(in: array), 1...3)
	}
}
