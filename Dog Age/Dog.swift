//  Dog.swift
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Jon Brown Designs All rights reserved.
//

//
//  Dog.swift
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Jon Brown Designs. All rights reserved.
//

import Foundation
import Quartz
import QuartzCore
import Cocoa
import DGCharts

class Dog: NSObject, NSApplicationDelegate, CAAnimationDelegate {
    
    @IBOutlet var answerField: NSTextField!
    @IBOutlet var numberField: NSTextField!
    @IBOutlet var numberField2: NSTextField!
    @IBOutlet var typeField: NSPopUpButton!
    @IBOutlet var typeField2: NSPopUpButton!
    @IBOutlet var alertField: NSTextField!
    @IBOutlet var errorSheet: NSWindow!
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var aButton: NSButton!
    @IBOutlet weak var aButton2: NSButton!
    @IBOutlet weak var webView: HorizontalBarChartView!
    @IBOutlet var myProgress: NSProgressIndicator!
    @IBOutlet var myProgress2: NSProgressIndicator!
    @IBOutlet var topView: NSView!
    @IBOutlet var view: NSView!
    @IBOutlet var secondView: NSView!
    @IBOutlet var GraphClipping:NSView!
    @IBOutlet var leg1:NSView!
    @IBOutlet var leg2:NSView!
    @IBOutlet var leg3:NSView!
    @IBOutlet var leg4:NSView!
    @IBOutlet var label1:NSTextField!
    @IBOutlet var label2:NSTextField!
    @IBOutlet var label3:NSTextField!
    @IBOutlet var label4:NSTextField!
    @IBAction func calculateAnswer(_ sender: Any) {
        

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
            
            
            webView.data = barChartData
            
            let colors = [NSUIColor(red: 192/255.0, green: 57/255.0, blue: 43/255.0, alpha: 1.0),
                NSUIColor(red: 243/255.0, green: 156/255.0, blue: 18/255.0, alpha: 1.0),
                NSUIColor(red: 39/255.0, green: 174/255.0, blue: 96/255.0, alpha: 1.0),
                NSUIColor(red: 41/255.0, green: 128/255.0, blue: 185/255.0, alpha: 1.0)]
            barChartDataSet.colors = colors
            
          }
        
        
        var num1: Float
        var type: Float
        var answer: Float
        var y: Float
        
        let indexInteger = typeField.indexOfSelectedItem
        
        let defaults = UserDefaults.standard
        let flipin = defaults.object(forKey: "flipPref") as! Int
        let flipValue = flipin
        
        if flipValue == 1 {
            
            print("Flip Status: \(flipValue)")
            num1 = numberField2.floatValue
        } else {
            
            print("Flip Status: \(flipValue)")
            num1 = numberField.floatValue
        }
        
        
        type = typeField.floatValue
        print(type)
        
        // Dog Calculation
        
        if indexInteger == 0 {
            
            if num1 <= 0 {
                
                answer = 0
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
                
            } else if num1 > 9999 {
                
                answer = 4
                numberField.stringValue = "30"
                numberField2.stringValue = "30"
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
                
            } else {
                
                
                
                if flipValue == 0 {
                    
                    // People Age to Animal
                    
                    y = (num1 >= 21) ? ((num1 - 21) / 4 + 2) : (num1 / 10.5)
                    answer = (y * 100) / 100
                    
                    // Perform Conversion
                    
                    let numField1 = NSNumber(value: answer).stringValue
                    numberField2.stringValue = numField1
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                } else {
                    
                    // Animal Age to People
                    
                    y = (num1 >= 2) ? (21 + ((num1 - 2) * 4)) : (num1 * 10.5)
                    answer = (y * 100) / 100
                    
                    // Perform Conversion
                    
                    let numField2 = NSNumber(value: answer).stringValue
                    numberField.stringValue = numField2
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                }
                
                //webView.evaluateJavaScript("loadDogData()", completionHandler: nil)
                
                label1.stringValue = "Sm."
                label2.stringValue = "Med."
                label3.stringValue = "Lg."
                label4.stringValue = "People."
                let one = [18.0]
                let two = [10.0]
                let three = [8.0]
                let four = [80.0]
                setChart(values: one, yvalues: two, y2values: three, y3values: four)
                webView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5)
                
                // Select Dog Popup
                
                let tagOfChoice = 0
                typeField.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
                typeField2.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
            }
            
            // Cat Calulation
        } else if indexInteger == 1 {
            
            if num1 <= 0 {
                
                answer = 0
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
            } else if num1 > 9999 {
                
                answer = 4
                numberField.stringValue = "30"
                numberField2.stringValue = "30"
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
            } else {
                
                if flipValue == 0 {
                    
                    // People Age to Animal
                    
                    
                    if (num1 >= 0) && (num1 <= 15) {
                        
                        answer = 1
                    } else if (num1 >= 16) && (num1 <= 24) {
                        
                        answer = 2
                    } else {
                        answer = ((num1 - 24) / 4) + (2)
                    }
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField2.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                    
                } else {
                    
                    // Animal Age to People
                    
                    
                    if (num1 >= 0) && (num1 <= 1) {
                        
                        answer = 15
                    } else if (num1 >= 1) && (num1 <= 2) {
                        
                        answer = 24
                    } else {
                        answer = ((num1 - 2) * 4) + (24)
                    }
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                }
                
               // webView.evaluateJavaScript("loadCatData()", completionHandler: nil)
                
                label1.stringValue = "Outdoor."
                label2.stringValue = "Indoor."
                label3.stringValue = "Wildcat."
                label4.stringValue = "People."
                let one = [5.0]
                let two = [55.0]
                let three = [30.0]
                let four = [80.0]
                setChart(values: one, yvalues: two, y2values: three, y3values: four)
                webView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5)
                
                // Select Cat Popup
                
                let tagOfChoice = 1
                typeField.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
                typeField2.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
            }
            
            // Cow Calulation
        } else if indexInteger == 2 {
            
            if num1 <= 0 {
                
                answer = 0
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
            } else if num1 > 9999 {
                
                answer = 4
                numberField.stringValue = "30"
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
            } else {
                
                if flipValue == 0 {
                    
                    answer = num1 * 6
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField2.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                } else {
                    
                    answer = num1 / 6
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                }
            }
            //webView.evaluateJavaScript("loadCowData()", completionHandler: nil)
            
            label1.stringValue = "Organic."
            label2.stringValue = "Dairy."
            label3.stringValue = "Wild."
            label4.stringValue = "People."
            let one = [20.0]
            let two = [6.0]
            let three = [28.0]
            let four = [80.0]
            setChart(values: one, yvalues: two, y2values: three, y3values: four)
            webView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5)
            
            // Select Cow Popup
            
            let tagOfChoice = 2
            typeField.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
            typeField2.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
            
            // Rabbit Calulation
        } else if indexInteger == 3 {
            
            if num1 <= 0 {
                
                answer = 0
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
            } else if num1 > 9999 {
                
                answer = 4
                numberField.stringValue = "30"
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
            } else {
                
                if flipValue == 0 {
                    
                    answer = num1 * 9.25
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField2.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                } else {
                    
                    answer = num1 / 9.25
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                }
            }
            //webView.evaluateJavaScript("loadRabbitData()", completionHandler: nil)
            
            label1.stringValue = "Farm."
            label2.stringValue = "Wild."
            label3.stringValue = "Pet."
            label4.stringValue = "People."
            let one = [10.0]
            let two = [5.0]
            let three = [19.0]
            let four = [80.0]
            setChart(values: one, yvalues: two, y2values: three, y3values: four)
            webView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5)
            
            
            // Select Cow Popup
            
            let tagOfChoice = 3
            typeField.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
            typeField2.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
            
            // Duck Calulation
        } else if indexInteger == 4 {
            
            if num1 <= 0 {
                
                answer = 0
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
            } else if num1 > 9999 {
                
                answer = 4
                numberField.stringValue = "30"
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
            } else {
                
                if flipValue == 0 {
                    
                    answer = num1 * 6.25
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField2.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                } else {
                    
                    answer = num1 / 6.25
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                }
            }
           // webView.evaluateJavaScript("loadDuckData()", completionHandler: nil)
            
            label1.stringValue = "Farm."
            label2.stringValue = "Wild."
            label3.stringValue = "Pet."
            label4.stringValue = "People."
            let one = [10.0]
            let two = [18.0]
            let three = [7.0]
            let four = [80.0]
            setChart(values: one, yvalues: two, y2values: three, y3values: four)
            webView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5)
            
            
            // Select Cow Popup
            
            let tagOfChoice = 4
            typeField.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
            typeField2.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
            
            // Chicken Calulation
        } else {
            
            if num1 <= 0 {
                
                answer = 0
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
                
            } else if num1 > 9999 {
                
                answer = 4
                numberField.stringValue = "30"
                alertField.stringValue = "Please enter a value between 0 and 9999 years."
                view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
            } else {
                
                if flipValue == 0 {
                    
                    answer = num1 * 8.12
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField2.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                } else {
                    
                    answer = num1 / 8.12
                    
                    // Perform Conversion
                    
                    let numField = NSNumber(value: answer).stringValue
                    numberField.stringValue = numField
                    
                    // Change Label
                    
                    window.title = "Animal Age"
                }
            }
            //webView.evaluateJavaScript("loadChickenData()", completionHandler: nil)
            
            label1.stringValue = "Farm."
            label2.stringValue = "Wild."
            label3.stringValue = "Pet."
            label4.stringValue = "People."
            let one = [10.0]
            let two = [5.0]
            let three = [19.0]
            let four = [80.0]
            setChart(values: one, yvalues: two, y2values: three, y3values: four)
            webView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5)
            
            
            // Select Cow Popup
            
            let tagOfChoice = 5
            typeField.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
            typeField2.selectItem(at: typeField.indexOfItem(withTag: tagOfChoice))
        }
        
        
        let answerFormatter = NumberFormatter()
        answerFormatter.format = "#,###;0;(#,##0)"
        answerField.formatter = answerFormatter
        answerField.intValue = Int32(answer)

        
    }
    
    @IBAction func isError(_ sender: Any) {
        view.window?.beginSheet(errorSheet, completionHandler: { returnCode in
                    print("completionHandler called")
                })
        
    }
    
    @IBAction func doneError(_ sender: Any) {
        errorSheet.orderOut(nil)
        if let errorSheet = errorSheet {
            view.window?.endSheet(errorSheet)
        }
        
    }
    
    @IBAction func changeOperation(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        let flipin = defaults.object(forKey: "flipPref") as! Int
        let flipValue = flipin
        
        
        //typeField.selectItem(at: (sender as AnyObject).tag())
        
        var operation: Int
        
        if flipValue == 0 {
            operation = typeField.selectedTag()
        } else {
            operation = typeField2.selectedTag()
        }
        
        switch operation {
        case 0:
            if flipValue == 0 {
            } else {
                window.title = "Animal Age"
            }
            aButton.title = "Dog"
            aButton2.title = "Dog"
            typeField.selectItem(withTag: 0)
            typeField2.selectItem(withTag: 0)
        case 1:
            if flipValue == 0 {
                window.title = "Animal Age"
            } else {
                window.title = "Animal Age"
            }
            aButton.title = "Cat"
            aButton2.title = "Cat"
            typeField.selectItem(withTag: 1)
            typeField2.selectItem(withTag: 1)
        case 2:
            if flipValue == 0 {
                window.title = "Animal Age"
            } else {
                window.title = "Animal Age"
            }
            aButton.title = "Cow"
            aButton2.title = "Cow"
            typeField.selectItem(withTag: 2)
            typeField2.selectItem(withTag: 2)
        case 3:
            if flipValue == 0 {
                window.title = "Animal Age"
            } else {
                window.title = "Animal Age"
            }
            aButton.title = "Rabbit"
            aButton2.title = "Rabbit"
            typeField.selectItem(withTag: 3)
            typeField2.selectItem(withTag: 3)
        case 4:
            if flipValue == 0 {
                window.title = "Animal Age"
            } else {
                window.title = "Animal Age"
            }
            aButton.title = "Duck"
            aButton2.title = "Duck"
            typeField.selectItem(withTag: 4)
            typeField2.selectItem(withTag: 4)
        case 5:
            if flipValue == 0 {
                window.title = "Animal Age"
            } else {
                window.title = "Animal Age"
            }
            aButton.title = "Chicken"
            aButton2.title = "Chicken"
            typeField.selectItem(withTag: 5)
            typeField2.selectItem(withTag: 5)
        default:
            break
        }
        myProgress.startAnimation(self)
        myProgress2.startAnimation(self)
        perform(#selector(Dog.dogAnswer(_:)), with: nil, afterDelay: 2.6)
        calculateAnswer(sender)
    }
    
    @IBAction func changeAge(_ sender: Any) {
        
        myProgress.startAnimation(self)
        myProgress2.startAnimation(self)
        perform(#selector(Dog.dogAnswer(_:)), with: nil, afterDelay: 0.15)
        calculateAnswer(sender)
        
    }
    
    @IBAction func showflip(_ sender: Any) {
        
        let animation = CATransition()
        animation.type = CATransitionType(rawValue: "cube")
        animation.subtype = .fromTop
        animation.duration = 0.25
        animation.delegate = self
        //animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        view.wantsLayer = true // Turn on backing layer
        view.animations = ["subviews" : animation]
        
        view.animator().replaceSubview(topView, with: secondView)
        
        secondView.autoresizingMask = [.width, .height]
        secondView.needsDisplay = true
        
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "flipPref")
        let flipin = defaults.object(forKey: "flipPref") as! Int
        let flipValue = flipin
        
        print("Flip Status: \(flipValue)")
        
        myProgress.startAnimation(self)
        myProgress2.startAnimation(self)
        perform(#selector(Dog.dogAnswer(_:)), with: nil, afterDelay: 0.15)
        calculateAnswer(sender)
        
    }
    
    @IBAction func hideflip(_ sender: Any) {
        
        let animation = CATransition()
        animation.type = CATransitionType(rawValue: "cube")
        animation.subtype = .fromBottom
        animation.duration = 0.25
        animation.delegate = self
        //animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        view.wantsLayer = true // Turn on backing layer
        view.animations = ["subviews" : animation]
        
        
        view.animator().replaceSubview(secondView, with: topView)
        
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "flipPref")
        let flipin = defaults.object(forKey: "flipPref") as! Int
        let flipValue = flipin
        
        print("Flip Status: \(flipValue)")
        
        myProgress.startAnimation(self)
        myProgress2.startAnimation(self)
        perform(#selector(Dog.dogAnswer(_:)), with: nil, afterDelay: 0.15)
        calculateAnswer(sender)
        
    }
    
    override func awakeFromNib() {
        myProgress.isDisplayedWhenStopped = false
        myProgress2.isDisplayedWhenStopped = false
        
        let answerFormatter = NumberFormatter()
        answerFormatter.format = "#,###;0;(#,##0)"
        numberField.formatter = answerFormatter
        numberField2.formatter = answerFormatter
        
    }
    
    @objc func dogAnswer(_ timer: Timer?) {
        myProgress.stopAnimation(self)
        myProgress2.stopAnimation(self)
    }
}
