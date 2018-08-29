//
//  AppDelegate.swift
//  LinesSorter
//
//  Created by Vadym Bulavin on 8/14/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

