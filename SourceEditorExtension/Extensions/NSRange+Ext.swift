//
//  NSRange+Ext.swift
//  SourceEditorExtension
//
//  Created by Vadym Bulavin on 8/22/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

extension NSRange {
	init(_ range: CountableClosedRange<Int>) {
		self = NSRange(location: range.lowerBound, length: range.upperBound - range.lowerBound + 1)
	}
}
