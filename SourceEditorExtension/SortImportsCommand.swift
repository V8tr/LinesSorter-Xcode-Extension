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
        
        var localizedDescription: String {
            switch self {
            case .notFound:
                return "Not import statements found"
            }
        }
    }

	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Swift.Error?) -> Void ) -> Void {
//        Prettifier().prettify(lines: invocation.buffer.lines)
        LinesSorter().sort(lines: invocation.buffer.lines, filter: { $0.contains("import") }, comparator: <)

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
