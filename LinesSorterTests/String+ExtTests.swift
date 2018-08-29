//
//  String+ExtTests.swift
//  LinesSorterTests
//
//  Created by Vadym Bulavin on 8/22/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import XCTest

class String_ExtTests: XCTestCase {
    
    func test_isBlank() {
        XCTAssertTrue("".isBlank)
        XCTAssertTrue(" ".isBlank)
        XCTAssertTrue("\n".isBlank)
        XCTAssertFalse("123".isBlank)
    }
    
    func test_isImportLine() {
        XCTAssertFalse("".isImportLine)
        XCTAssertFalse("i m p o r t".isImportLine)
        XCTAssertTrue("import".isImportLine)
        XCTAssertTrue("        import   ABC".isImportLine)
    }
}
