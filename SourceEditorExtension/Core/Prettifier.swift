//
//  Prettifier.swift
//  LinesSorter
//
//  Created by Vadim Bulavin on 8/21/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

struct Prettifier {
    
    func prettify(_ lines: NSMutableArray, in range: CountableClosedRange<Int>) {
        guard range.upperBound > 0 else {
            return
        }
        
        var range = range
            .omittingFirstAndLastNewLine(in: lines)
            .saneRange(for: lines.count)
        
        trimWhitespaces(from: lines, in: range)
        
        let linesRemoved = removeBlankLines(lines: lines, in: range)
        range = range.lowerBound...(range.upperBound - linesRemoved)
        
        LinesSorter().sort(lines, in: range, by: <)
        
        removeDuplicates(from: lines, in: range)
    }
    
    private func trimWhitespaces(from lines: NSMutableArray, in range: CountableClosedRange<Int>) {
        for lineIndex in range where lines[lineIndex] is String {
            lines[lineIndex] = (lines[lineIndex] as! String).trimmingCharacters(in: .whitespaces)
        }
    }
    
    private func removeBlankLines(lines: NSMutableArray, in range: CountableClosedRange<Int>) -> Int {
        let range = NSRange(range)
        let subarray = lines.subarray(with: range) as? [String] ?? []
        let countBeforeRemoval = lines.count
        
        let filteredObjects = subarray.filter { !$0.isBlank }
        
        lines.replaceObjects(in: range, withObjectsFrom: filteredObjects)
        
        return countBeforeRemoval - lines.count
    }
    
    private func removeDuplicates(from lines: NSMutableArray, in range: CountableClosedRange<Int>) {
        let range = NSRange(range)
        let subarray = lines.subarray(with: range) as? [AnyHashable] ?? []
        subarray
            .duplicatedElementsIndices
            .map { $0 + range.lowerBound }
            .forEach(lines.removeObject(at:))
    }
}
