//
//  Array+DuplicatesElements.swift
//  SourceEditorExtension
//
//  Created by Vadim Bulavin on 8/20/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    var duplicatedElementsIndices: Set<Int> {
        var result: [Element] = []
        var indices = Set<Int>()
        for (index, value) in self.enumerated() {
            if !result.contains(value) {
                result.append(value)
            } else {
                indices.insert(index)
            }
        }
        print(indices)
        return indices
    }
}
