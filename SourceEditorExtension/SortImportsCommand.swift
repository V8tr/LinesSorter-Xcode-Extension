//
//  SortImportsCommand.swift
//  SourceEditorExtension
//
//  Created by Vadym Bulavin on 8/17/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation
import XcodeKit

class SortImportsCommand: NSObject, XCSourceEditorCommand {

	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Swift.Error?) -> Void ) -> Void {
		let isImportLine = { (line: String) in line.contains("import") }
		let isBlank = { (line: String) in line.isBlank }
		let bridgedLines = invocation.buffer.lines.compactMap { $0 as? String }

		if let range = LinesSequenceBuilder().rangeOfSequence(matching: isImportLine, ignoreWhenInMiddle: isBlank, from: bridgedLines) {
			Prettifier().prettify(invocation.buffer.lines, in: range)
		}

		completionHandler(nil)
	}
}
