//
//  AppDelegate.swift
//  Wine
//
//  Created by Danny on 2016/1/2.
//  Copyright © 2016年 Danny. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "exitApp", userInfo: nil, repeats: false)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    
    func applicationShouldHandleReopen(sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        return true
    }

    func application(sender: NSApplication, openFile filename: String) -> Bool {
        let task = NSTask()
        task.currentDirectoryPath = (filename as NSString).stringByDeletingLastPathComponent
        task.launchPath = "/usr/local/bin/wine"
        task.arguments = [filename]
        task.launch()
        
        NSTimer.scheduledTimerWithTimeInterval(0, target: self, selector: "exitApp", userInfo: nil, repeats: false)
        
        return true
    }
    
    func exitApp() {
        NSApplication.sharedApplication().terminate(self)
    }

}

