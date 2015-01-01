//
//  ViewController.swift
//  TipCalculator
//
//  Created by Dan Hipschman on 12/31/14.
//  Copyright (c) 2014 Dan Hipschman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageControl: UISegmentedControl!
    
    @IBAction func onEditingChange(sender: AnyObject) {
        let billAmount = (billField.text as NSString).doubleValue
        let percentageIndex = percentageControl.selectedSegmentIndex
        let percentage = [0.18, 0.20, 0.22][percentageIndex]
        let tipAmount = billAmount * percentage
        let totalAmount = billAmount + tipAmount
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

