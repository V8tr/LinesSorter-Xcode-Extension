//
//  PrettifierTests.swift
//  LinesSorterTests
//
//  Created by Vadim Bulavin on 8/21/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest
@testable import LinesSorter

class PrettifierTests: XCTestCase {

	func test_prettifier_sortsByFilter() {
		let lines = NSMutableArray(array: ["A2", "A1"])

		Prettifier().prettify(lines, in: 0...1)

		XCTAssertEqual(lines, ["A1", "A2"])
	}

	func test_prettifier_unsortedImports_sortsImports() {

		let lines = NSMutableArray(array: ["import B", "import C", "import A"])

		Prettifier().prettify(lines, in: 0...2)

		XCTAssertEqual(lines, ["import A", "import B", "import C"])
	}

	func test_prettifier_unsortedImportsWithLeadingAndTrailingWhiteSpaces_sortsImportsAndTrimsWhitespaces() {
		let lines = NSMutableArray(array: ["   import B ", "    import C ", "   import A "])

		Prettifier().prettify(lines, in: 0...2)

		XCTAssertEqual(lines, ["import A", "import B", "import C"])
	}

	func test_prettifier_duplicatedLines_removesDuplicates() {
		let lines = NSMutableArray(array: ["A", "A"])

		Prettifier().prettify(lines, in: 0...1)

		XCTAssertEqual(lines, ["A"])
	}

	func test_prettifier_duplicatedLines_removesDuplicatesInRange() {
		let lines = NSMutableArray(array: ["A", "A", "B", "B"])

		Prettifier().prettify(lines, in: 0...1)

		XCTAssertEqual(lines, ["A", "B", "B"])
	}

	func test_prettifier_rangeGreaterThanLinesSize_snapsToBounds() {
		let lines = NSMutableArray(array: ["B", "A"])

		Prettifier().prettify(lines, in: 0...10)

		XCTAssertEqual(lines, ["A", "B"])
	}

	func test_prettifier_emptyInput_doesNotModifyInput() {
		let lines = NSMutableArray()

		Prettifier().prettify(lines, in: 0...0)

		XCTAssertEqual(lines, [])
	}

	func test_prettifier_smallerRange_prettifiesLinesInRange() {
		let lines = NSMutableArray(array: ["IGNORED B", "IGNORED A", "C", "   A ", " A", "B", "IGNORED Z", "IGNORED A"])

		Prettifier().prettify(lines, in: 2...5)

		XCTAssertEqual(lines, ["IGNORED B", "IGNORED A", "A", "B", "C", "IGNORED Z", "IGNORED A"])
	}

	func test_prettifier_removesNewLinesInTheMiddle() {
		let lines = NSMutableArray(array: ["A", "\n", "A"])

		Prettifier().prettify(lines, in: 0...3)

		XCTAssertEqual(lines, ["A"])
	}

	func test_prettifier_doesNotRemoveFirstAndLastNewLines() {
		let lines = NSMutableArray(array: ["\n", "A", "\n"])

		Prettifier().prettify(lines, in: 0...2)

		XCTAssertEqual(lines, ["\n", "A", "\n"])
	}
    
    func test_prettifier_removesTrailingNewLinesAndLeavesOne() {
        let lines = NSMutableArray(array: ["\n", "A", "\n", "\n", "\n"])
        
        Prettifier().prettify(lines, in: 0...4)
        
        XCTAssertEqual(lines, ["\n", "A", "\n"])
    }
    
    func test_prettifier_removesLeadingNewLinesAndLeavesOne() {
        let lines = NSMutableArray(array: ["\n",  "\n", "\n", "A", "\n"])
        
        Prettifier().prettify(lines, in: 0...4)
        
        XCTAssertEqual(lines, ["\n", "A", "\n"])
    }
}
