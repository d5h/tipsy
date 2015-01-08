//
//  SettingsViewController.swift
//  tipsy
//
//  Created by Dan Hipschman on 1/7/15.
//  Copyright (c) 2015 Dan Hipschman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaultPercent = getDefaultPercent()
        tipLabel.text = "Default tip \(Int(defaultPercent))%"
        stepper.value = defaultPercent
        stepper.minimumValue = 10
    }

    @IBAction func valueChanged(sender: UIStepper) {
        setDefaultPercent(stepper.value)
        tipLabel.text = "Default tip \(Int(stepper.value))%"
    }

    @IBAction func doneClicked(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
