//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Ankita Prasad on 8/13/15.
//  Copyright (c) 2015 Ankita Prasad. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let textLabel = "Default Tip Percentage"
    let themeLabel = "Dark Theme"
    var defaultTipSelectionIndex = 0
    var isThemeDark = false
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultText.text = textLabel
        themeText.text = themeLabel
        defaultTipPercentage.selectedSegmentIndex = defaultTipSelectionIndex
        themeSwitch.on = isThemeDark
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var themeText: UILabel!

    @IBOutlet var defaultText: UILabel!

    @IBOutlet var themeSwitch: UISwitch!
    
    @IBOutlet var defaultTipPercentage: UISegmentedControl!
    
    @IBAction func onSelectionChanged(sender: UISegmentedControl) {
        
        var selectedIndex = sender.selectedSegmentIndex
        var defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(selectedIndex, forKey: "tipIndex")
        defaults.synchronize()
    }

    
    @IBAction func onThemeChanged(sender: UISwitch) {
        var darktheme = sender.on
        var defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(darktheme, forKey: "tipThemeIsDark")
        defaults.synchronize()
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
