//
//  LinesSorter.swift
//  SortLines
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

struct LinesSorter {
	func sort(lines: [String], filter: (String) -> Bool, comparator: (String, String) -> Bool) -> [String] {
		return lines.filter(filter).sorted(by: comparator)
	}
}
