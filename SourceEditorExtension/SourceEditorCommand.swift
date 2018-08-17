//
//  SourceEditorCommand.swift
//  SourceEditorExtension
//
//  Created by Vadym Bulavin on 8/14/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.

		invocation.cancellationHandler = {

		}

		print("commandIdentifier: \(invocation.commandIdentifier)")

		print("completeBuffer: \(invocation.buffer.completeBuffer)")
		print("contentUTI: \(invocation.buffer.contentUTI)")
		print("lines: \(invocation.buffer.lines)")
		print("selections: \(invocation.buffer.selections)")

        completionHandler(nil)
    }
    
}
