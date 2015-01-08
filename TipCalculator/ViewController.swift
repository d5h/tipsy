//
//  ViewController.swift
//  TipCalculator
//
//  Created by Dan Hipschman on 12/31/14.
//  Copyright (c) 2014 Dan Hipschman. All rights reserved.
//

import UIKit

func strip(var s: String, c: String) -> String {
    // Horrible :(
    while (countElements(s) > 0 && s[s.startIndex] == Character(c)) {
        // Can't have an empty range
        if countElements(s) == 1 {
            return ""
        }
        let range = Range(start: s.startIndex.successor(), end: s.endIndex)
        s = s.substringWithRange(range)
    }
    return s
}

class ViewController: UIViewController {
    
    enum RoundingType {
        case None
        case Up
        case Down
        
        func cycle() -> RoundingType {
            switch self {
            case .None:
                return RoundingType.Up
            case .Up:
                return RoundingType.Down
            case .Down:
                return RoundingType.None
            }
        }
        
        func round(value: Double) -> Double {
            switch self {
            case .None:
                return value
            case .Up:
                return ceil(value)
            case .Down:
                return floor(value)
            }
        }
    }

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageControl: UISegmentedControl!
    var percentages = [0.0, 0.0, 0.0]
    var tipRounding = RoundingType.None
    var totalRounding = RoundingType.None
    
    @IBAction func onEditingChange(sender: AnyObject) {
        var billString = strip(strip(billField.text, "$"), "0")
        if countElements(billString) == 0 {
            billString = "0"
        }
        let billAmount = (billString as NSString).doubleValue
        let percentageIndex = percentageControl.selectedSegmentIndex
        let percentage = percentages[percentageIndex] / 100.0
        var tipAmount = tipRounding.round(billAmount * percentage)
        let totalAmount = totalRounding.round(billAmount + tipAmount)
        if (totalAmount != billAmount + tipAmount) {
            tipAmount = totalAmount - billAmount
        }
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
        billField.text = "$" + billString
    }

    @IBAction func onTipTap(sender: AnyObject) {
        tipRounding = tipRounding.cycle()
        if tipRounding != .None {
            totalRounding = .None
        }
        onEditingChange(0)
    }
    
    @IBAction func onTotalTap(sender: AnyObject) {
        totalRounding = totalRounding.cycle()
        if totalRounding != .None {
            tipRounding = .None
        }
        onEditingChange(0)
    }

    @IBAction func onViewTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setPercentageControl()
        percentageControl.selectedSegmentIndex = 1
        onEditingChange(0)
    }
    
    func setPercentageControl() {
        let defaultPercent = getDefaultPercent()
        percentages[0] = floor(0.9 * defaultPercent)
        percentages[1] = defaultPercent
        percentages[2] = ceil(1.1 * defaultPercent)
        percentageControl.setTitle(String(Int(percentages[0])), forSegmentAtIndex: 0)
        percentageControl.setTitle(String(Int(percentages[1])), forSegmentAtIndex: 1)
        percentageControl.setTitle(String(Int(percentages[2])), forSegmentAtIndex: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

