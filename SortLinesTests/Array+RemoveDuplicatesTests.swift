//
//  Array+RemoveDuplicates.swift
//  SortLinesTests
//
//  Created by Vadim Bulavin on 8/20/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest
@testable import SortLines

class ArrayRemoveDuplicates: XCTestCase
{
    func test_removingDuplicates_resolvesDuplicates()
    {
        XCTAssertEqual(["A", "A", "B", "B", "A"].removingDuplicates(), ["A", "B"])
    }
    
    func test_removingDuplicates_preservesElementsOrder()
    {
        XCTAssertEqual(["A", "B", "A"].removingDuplicates(), ["A", "B"])
    }
}
