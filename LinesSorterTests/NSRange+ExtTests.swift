//
//  NSRange+ExtTests.swift
//  LinesSorterTests
//
//  Created by Vadym Bulavin on 8/22/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest

class NSRange_ExtTests: XCTestCase {
    
    func test_initWithCountableClosedRange() {
        XCTAssertEqual(NSRange(0...0), NSRange(location: 0, length: 1))
        
        XCTAssertEqual(NSRange(1...2), NSRange(location: 1, length: 2))
    }
}
