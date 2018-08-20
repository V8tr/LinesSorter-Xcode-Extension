//
//  Prettifier.swift
//  SortLines
//
//  Created by Vadim Bulavin on 8/21/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

struct Prettifier {
    
    func prettify(lines: NSMutableArray) {
        let withoutDuplicates = lines.compactMap { $0 as? String }.removingDuplicates()
        
        lines.removeAllObjects()
        lines.addObjects(from: withoutDuplicates)
        
        removeNewLinesAndWhiteSpaces(from: lines)
    }
    
    private func removeNewLinesAndWhiteSpaces(from lines: NSMutableArray) {
        var indexesToRemove: [Int] = []
        
        for case let (index, line as String) in lines.enumerated() where line.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            indexesToRemove.append(index)
        }
        
        for index in indexesToRemove {
            lines.removeObject(at: index)
        }
    }
}
