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
		defer { completionHandler(nil) }

		let bridgedLines = invocation.buffer.lines.compactMap { $0 as? String }

		if let range = LinesSequenceBuilder().rangeOfSequence(matching: { $0.isImportLine }, ignoreWhenInMiddle: { $0.isBlank }, from: bridgedLines) {
			Prettifier().prettify(invocation.buffer.lines, in: range)
		}
	}
}
