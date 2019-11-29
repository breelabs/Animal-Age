//
//  AppDelegate.h
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Food & Water Watch. All rights reserved.
//
import Cocoa
import WebKit

class AppDelegate : NSObject, NSApplicationDelegate {
    @IBOutlet var TxtShddow: NSTextField!
    @IBOutlet var TxtShddow2: NSTextField!
    @IBOutlet var TxtShddow3: NSTextField!
    @IBOutlet var window: NSWindow!
    @IBOutlet var arrowImage: NSButton!
    @IBOutlet var arrowImage2: NSButton!
    @IBOutlet var aButton: NSButton!
    @IBOutlet var aButton2: NSButton!
    @IBOutlet var graphView:WKWebView!
    @IBOutlet var prefSheet:NSWindow!
    @IBOutlet var secondView:NSView!
    
    @IBOutlet var popover: NSPopover!
    @IBOutlet var popcalc: NSPopover!
    @IBOutlet var poprevcalc: NSPopover!
    @IBOutlet var topView: NSView!
    @IBOutlet var view: NSView!
    
    
    override init() {
        AppDelegate.setupArmchair()
        
    }
    
    
    // Setup the UA App Review Manager
    
    
    @IBAction func showPopup(sender:AnyObject!) {

        self.popover.show(relativeTo: sender.bounds,
                          of: sender as! NSView,
                          preferredEdge: .maxY)
    }
    
    @IBAction func showCalc(sender:AnyObject!) {
        
        self.popcalc.show(relativeTo: sender.bounds,
                          of: sender as! NSView,
                          preferredEdge: .maxY)
        
    }
    
    @IBAction func showrevCalc(sender:AnyObject!) {
        
        self.poprevcalc.show(relativeTo: sender.bounds,
                          of: sender as! NSView,
                          preferredEdge: .maxY)
    }
    
    
    func applicationShouldTerminateAfterLastWindowClosed(theApplication:NSApplication!) -> Bool {
        return true
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        NSApplication.shared.terminate(self)
        return true
    }
    
    override func awakeFromNib() {
        
        view.addSubview(topView)
        
        let defaults:UserDefaults! = UserDefaults.standard
        defaults.set(false, forKey:"flipPref")
        
        let url = Bundle.main.url(forResource: "index", withExtension: "html")!
        graphView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        graphView.load(request)
        
        window.backgroundColor = NSColor(deviceRed:0.74, green:0.74, blue:0.74, alpha:1.0)
        
        let arrows:NSImage! = NSImage(named: "OppositeArrows")
        
        arrowImage.image = arrows
        arrowImage.alternateImage = arrows
        arrowImage2.image = arrows
        arrowImage2.alternateImage = arrows
        
        aButton.title = "Dog"
        aButton2.title = "Dog"
        window.title = "Animal Age"
        
    }
    
    func applicationWillFinishLaunching(aNotification:NSNotification!) {
        
    }
    
    @IBAction func isPref(sender:AnyObject!) {
        view.window?.beginSheet(prefSheet, completionHandler: { returnCode in
            print("completionHandler called")
        })
    }
    
    @IBAction func donePref(sender:AnyObject!) {
        prefSheet.orderOut(nil)
        view.window?.endSheet(prefSheet)
    }
    
}

let appID = "717666889" // Our App!

import Armchair

extension AppDelegate {
    
    class func setupArmchair() {
        // Normally, all the setup would be here.
        // But, because we are presenting a few different setups in the example,
        // The config will be in the view controllers
        //     Armchair.appID("408981381") // Pages
        //
        // It is always best to load Armchair as early as possible
        // because it needs to receive application life-cycle notifications
        //
        // NOTE: The appID call always has to go before any other Armchair calls
        Armchair.appID(appID)
        Armchair.debugEnabled(true)
    }
}
