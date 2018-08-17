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

	enum Error: LocalizedError {
		case notFound
	}

	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
		let lines = invocation.buffer.lines.compactMap { $0 as? String }

		guard let importsRange = LinesSequenceBuilder().rangeOfSequence(matching: { $0.contains("import") }, from: lines) else {
			completionHandler(Error.notFound)
			return
		}

		let imports = lines[importsRange.start...importsRange.start]
		let sortedImporst = LinesSorter().sort(lines: imports, filter: { $0.contains("import") }, comparator: <)

		completionHandler(nil)
	}

	private func lastImportLineIndex(lines: [String]) -> Int? {
		for (index, line) in lines.reversed().enumerated() {
			if line.contains("import") {
				return lines.count - index
			}
		}
		return nil
	}
}
