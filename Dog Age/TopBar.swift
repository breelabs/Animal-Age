//
//  TopBar.swift
//  Animal Age
//
//  Created by Jon on 6/15/19.
//  Copyright © 2019 JBD. All rights reserved.
//

import Foundation
import Cocoa
import WebKit

class topBar: NSView {
    // Define the variables as properties
    var startingColor: NSColor?
    var endingColor: NSColor?
    var angle = 0
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        self.startingColor = NSColor(calibratedWhite: 1.0, alpha: 1.0)
        self.endingColor = nil
        self.angle = 270
    }
    
    override func draw(_ aRect: NSRect) {
        NSColor(deviceRed: 0.679, green: 0.679, blue: 0.679, alpha: 1.0).set()
        bounds.fill()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
