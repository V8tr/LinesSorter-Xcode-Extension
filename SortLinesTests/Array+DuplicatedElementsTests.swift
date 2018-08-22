//
//  Array+DuplicatedElements.swift
//  SortLinesTests
//
//  Created by Vadim Bulavin on 8/20/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest
@testable import SortLines

class ArrayDuplicatedElementsTests: XCTestCase
{
	func test_duplicatesElementsIndices() {
		XCTAssertEqual(["A", "A", "B", "B", "A"].duplicatedElementsIndices, Set([1, 3, 4]))
	}
}
