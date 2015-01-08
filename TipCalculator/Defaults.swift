//
//  Defaults.swift
//  tipsy
//
//  Created by Dan Hipschman on 1/7/15.
//  Copyright (c) 2015 Dan Hipschman. All rights reserved.
//

import Foundation

func getDefaultPercent() -> Double {
    var defaults = NSUserDefaults.standardUserDefaults()
    var defaultPercent = Double(defaults.integerForKey("percent"))
    if defaultPercent == 0.0 {
        defaultPercent = 20.0
    }
    return defaultPercent
}

func setDefaultPercent(value: Double) {
    var defaults = NSUserDefaults.standardUserDefaults()
    defaults.setDouble(value, forKey: "percent")
    defaults.synchronize()
}
