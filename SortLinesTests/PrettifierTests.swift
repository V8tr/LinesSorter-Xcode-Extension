//
//  PrettifierTests.swift
//  SortLinesTests
//
//  Created by Vadim Bulavin on 8/21/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest
@testable import SortLines

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
}
