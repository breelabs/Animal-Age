//
//  AppDelegate.h
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Food & Water Watch. All rights reserved.
//
import Cocoa
import WebKit
import DGCharts

#if WEBSITE
import Sparkle
#endif


class AppDelegate : NSObject, NSApplicationDelegate {
    @IBOutlet var TxtShddow: NSTextField!
    @IBOutlet var TxtShddow2: NSTextField!
    @IBOutlet var TxtShddow3: NSTextField!
    @IBOutlet var window: NSWindow!
    @IBOutlet var arrowImage: NSButton!
    @IBOutlet var arrowImage2: NSButton!
    @IBOutlet var aButton: NSButton!
    @IBOutlet var aButton2: NSButton!
    @IBOutlet var graphView:HorizontalBarChartView!
    @IBOutlet var prefSheet:NSWindow!
    @IBOutlet var secondView:NSView!
    @IBOutlet var graphBack:NSView!
    @IBOutlet var popover: NSPopover!
    @IBOutlet var popcalc: NSPopover!
    @IBOutlet var poprevcalc: NSPopover!
    @IBOutlet var topView: NSView!
    @IBOutlet var view: NSView!
    @IBOutlet var GraphClipping:NSView!
    @IBOutlet var leg1:NSView!
    @IBOutlet var leg2:NSView!
    @IBOutlet var leg3:NSView!
    @IBOutlet var leg4:NSView!
    @IBOutlet var lab1:NSTextField!
    @IBOutlet var lab2:NSTextField!
    @IBOutlet var lab3:NSTextField!
    @IBOutlet var lab4:NSTextField!
    
    override init() {
        
#if WEBSITE
        
#endif
        

        
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
    
    func setChart(values: [Double], yvalues: [Double], y2values: [Double], y3values: [Double]) {
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = ""

        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<values.count {
            let dataEntry = BarChartDataEntry(x: 0, yValues:  [values[i],yvalues[i],y2values[i],y3values[i]], data: "groupChart")
                   //let dataEntry = BarChartDataEntry(x: Double(i) , y: values[i])
                   dataEntries.append(dataEntry)
       }
        
        print(dataEntries[0].data as Any)
        let barChartDataSet = BarChartDataSet(entries: dataEntries)
        barChartDataSet.drawValuesEnabled = false
        let barChartData = BarChartData(dataSet: barChartDataSet)
        barChartData.barWidth = Double(2)
        
        
        graphView.data = barChartData
        
        let colors = [NSUIColor(red: 192/255.0, green: 57/255.0, blue: 43/255.0, alpha: 1.0),
            NSUIColor(red: 243/255.0, green: 156/255.0, blue: 18/255.0, alpha: 1.0),
            NSUIColor(red: 39/255.0, green: 174/255.0, blue: 96/255.0, alpha: 1.0),
            NSUIColor(red: 41/255.0, green: 128/255.0, blue: 185/255.0, alpha: 1.0)]
        barChartDataSet.colors = colors
        
      }
    
    func setGradient() {
        graphBack.wantsLayer = true
        graphBack.layer?.backgroundColor = NSColor(named: "GraphBack")?.cgColor
    }
    


    
    override func awakeFromNib() {
        
        view.addSubview(topView)
        setGradient()
        leg1.asCircleOne()
        leg2.asCircleTwo()
        leg3.asCircleThree()
        leg4.asCircleFour()
        
        lab1.stringValue = "Sm."
        lab2.stringValue = "Med."
        lab3.stringValue = "Large."
        lab4.stringValue = "People."
       
        GraphClipping.wantsLayer = true
        GraphClipping.layer?.backgroundColor = NSColor(named: "GBack")?.cgColor
        GraphClipping.layer?.cornerRadius = 5.0
        
        let defaults:UserDefaults! = UserDefaults.standard
        defaults.set(false, forKey:"flipPref")
        
        self.graphView.rightAxis.drawAxisLineEnabled = false
        self.graphView.leftAxis.drawAxisLineEnabled = false
        self.graphView.xAxis.drawAxisLineEnabled = false
        self.graphView.rightAxis.drawLabelsEnabled = false
        self.graphView.xAxis.drawLabelsEnabled = false
        self.graphView.xAxis.drawGridLinesEnabled = false
        self.graphView.rightAxis.drawGridLinesEnabled = false
        self.graphView.leftAxis.drawGridLinesEnabled = false
        self.graphView.leftAxis.drawLabelsEnabled = false
        self.graphView.legend.enabled = false
        //self.graphView.isUserInteractionEnabled = false
        self.graphView.chartDescription.text = nil
        self.graphView.leftAxis.spaceMin = 0
        self.graphView.leftAxis.spaceMax = 0
        self.graphView.leftAxis.spaceTop = 0
        self.graphView.leftAxis.spaceBottom = 0
        self.graphView.xAxis.spaceMax = 0
        self.graphView.rightAxis.spaceMin = 0
        self.graphView.rightAxis.spaceMax = 0
        self.graphView.rightAxis.spaceTop = 0
        self.graphView.rightAxis.spaceBottom = 0
        self.graphView.xAxis.spaceMin = 0
        self.graphView.xAxis.spaceMax = 0
        self.graphView.autoScaleMinMaxEnabled = false
        
        let one = [18.0]
        let two = [10.0]
        let three = [8.0]
        let four = [80.0]
        setChart(values: one, yvalues: two, y2values: three, y3values: four)
        graphView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5)
        
        
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

#if WEBSITE
let appID = "717666889" // Our App!
#endif

extension NSView {
    func asCircleOne() {
        self.wantsLayer = true
        self.layer?.cornerRadius = 5.0;
        self.layer?.masksToBounds = true
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.white.cgColor
        self.layer?.backgroundColor = (NSColor(named: "One")?.cgColor as Any as! CGColor)
    }
}
extension NSView {
    func asCircleTwo() {
        self.wantsLayer = true
        self.layer?.cornerRadius = 5.0;
        self.layer?.masksToBounds = true
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.white.cgColor
        self.layer?.backgroundColor = (NSColor(named: "Two")?.cgColor as Any as! CGColor)
    }
}
extension NSView {
    func asCircleThree() {
        self.wantsLayer = true
        self.layer?.cornerRadius = 5.0;
        self.layer?.masksToBounds = true
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.white.cgColor
        self.layer?.backgroundColor = (NSColor(named: "Three")?.cgColor as Any as! CGColor)
    }
}
extension NSView {
    func asCircleFour() {
        self.wantsLayer = true
        self.layer?.cornerRadius = 5.0;
        self.layer?.masksToBounds = true
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.white.cgColor
        self.layer?.backgroundColor = (NSColor(named: "Four")?.cgColor as Any as! CGColor)
    }
}






