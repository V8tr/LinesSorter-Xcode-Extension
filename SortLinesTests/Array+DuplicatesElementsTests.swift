//
//  Array+DuplicatesElements.swift
//  SortLinesTests
//
//  Created by Vadim Bulavin on 8/20/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest
@testable import SortLines

class ArrayDuplicatesElementsTests: XCTestCase
{
	func test_duplicatesElementsIndices() {
		XCTAssertEqual(["A", "A", "B", "B", "A"].duplicatesElementsIndices, Set([1, 3, 4]))
	}
}
