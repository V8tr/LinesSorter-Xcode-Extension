//
//  String+Ext.swift
//  SourceEditorExtension
//
//  Created by Vadym Bulavin on 8/22/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import Foundation

extension String {
    var isBlank: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isImportLine: Bool {
        return contains("import")
    }
}
