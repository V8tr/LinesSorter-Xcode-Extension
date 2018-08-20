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

    func test_sort_doesNotModifySortedInput() {
        let lines = NSMutableArray(array: ["A1", "A2", "B"])

        LinesSorter().sort(lines: lines, filter: { $0.contains("A") }, comparator: <)

        XCTAssertEqual(lines, ["A1", "A2", "B"])
    }

    func test_sort_sortsLinesUsingComparator() {
        let lines = NSMutableArray(array: ["B", "A"])

        LinesSorter().sort(lines: lines, filter: { _ in true }, comparator: <)

        XCTAssertEqual(lines, ["A", "B"])
    }
    
    func test_sort_sortsWithinFilteredSubsequence() {
        let lines = NSMutableArray(array: ["B", "A2", "A1"])
        
        LinesSorter().sort(lines: lines, filter: { $0.contains("A") }, comparator: <)
        
        XCTAssertEqual(lines, ["B", "A1", "A2"])
    }
    
    func test_sort_sortsFirstMatchingSubsequence() {
        let lines = NSMutableArray(array: ["A2", "A1", "B", "A4", "A3"])
        
        LinesSorter().sort(lines: lines, filter: { $0.contains("A") }, comparator: <)
        
        XCTAssertEqual(lines, ["A1", "A2", "B", "A4", "A3"])
    }
}
