//
//  HitView.swift
//  Dog Age
//
//  Created by Jon Brown on 3/12/24.
//  Copyright © 2024 JBD. All rights reserved.
//

import Foundation
import Cocoa

class SubclassNSView: NSView {

  public var isUserInteractionEnabled: Bool = true

  open override func becomeFirstResponder() -> Bool {
    if isUserInteractionEnabled == false {
      return false
    } else {
      return super.becomeFirstResponder()
    }
  }
}
