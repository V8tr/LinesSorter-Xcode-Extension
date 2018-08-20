//
//  Array+RemoveDuplicates.swift
//  SourceEditorExtension
//
//  Created by Vadim Bulavin on 8/20/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func removingDuplicates() -> Array<Element> {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        return result
    }
}
