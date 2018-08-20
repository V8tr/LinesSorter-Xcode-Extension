//
//  LinesSorter.swift
//  SortLines
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

struct LinesSorter {
    
	func sort(lines inputLines: NSMutableArray, filter: (String) -> Bool, comparator: (String, String) -> Bool) {
        let lines = inputLines.compactMap { $0 as? String }
        
        guard let importsRange = LinesSequenceBuilder().rangeOfSequence(matching: filter, from: lines) else {
            return
        }
        
        let imports = lines[importsRange.start...importsRange.end]
        let sortedImports = Array(imports).filter(filter).sorted(by: comparator)
        
        for lineIndex in importsRange.start...importsRange.end {
            inputLines[lineIndex] = sortedImports[lineIndex - importsRange.start]
        }
	}
}
