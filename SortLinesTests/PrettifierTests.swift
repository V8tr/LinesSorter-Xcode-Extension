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
    
    func test_prettify_removesNewLines() {
        let lines = NSMutableArray(array: ["A", "\n\n\n\n"])

        Prettifier().prettify(lines: lines)
        
    	XCTAssertEqual(lines, ["A"])
    }
    
    func test_prettify_removesWhitespaces() {
        let lines = NSMutableArray(array: ["A", "       "])
        
        Prettifier().prettify(lines: lines)
        
        XCTAssertEqual(lines, ["A"])
    }
    
    func test_prettifier_removesDuplicates() {
        let lines = NSMutableArray(array: ["A", "A"])
        
        Prettifier().prettify(lines: lines)
        
        XCTAssertEqual(lines, ["A"])
    }
}
