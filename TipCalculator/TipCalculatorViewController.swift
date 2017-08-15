//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Ankita Prasad on 8/13/15.
//  Copyright (c) 2015 Ankita Prasad. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"
        billAmount.becomeFirstResponder()
        tipPercentage.selectedSegmentIndex = defaultTipIndex
        
        
        // Get old bill amount if maintainState is set to true
        if(maintainState != nil && maintainState == true) {
        let userDefaults = UserDefaults.standard
            if let lastBillValue = userDefaults.object(forKey: "lastBillState") as? String {
                billAmount.text = lastBillValue
            }
        }
        updateThemeColors()
        updateValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var maintainState: Bool!
    @IBOutlet var billAmount: UITextField!
    
    @IBOutlet var tipLabel: UILabel!
    
    @IBOutlet var totalAmountLabel: UILabel!
    
    @IBOutlet var tipPercentage: UISegmentedControl!
    
    @IBOutlet var tipText: UILabel!
    
    @IBOutlet var totalText: UILabel!
    
    @IBAction func onTap(_ sender: AnyObject) {
        // view.endEditing(true)
        updateValues()
    }
    
    @IBAction func billEditChanged(_ sender: AnyObject) {
        updateValues()
    }

    // Computed property for the default tip stored in UserIndex
    var defaultTipIndex :Int {
        get {
            let userDeafults = UserDefaults.standard
            if let defaultTipIsNotNil = userDeafults.object(forKey: "tipIndex") as? Int{
                return defaultTipIsNotNil
            }
            else {
                return 0
            }
        }
    }
    
    // Computed property for the default theme stored in userIndex
    var defaultTiptheme :Bool{
        get{
            let userDeafults = UserDefaults.standard
            if let defaultTipThemeIsNotNil = userDeafults.object(forKey: "tipThemeIsDark") as? Bool{
                return defaultTipThemeIsNotNil
            }
            else {
                return false
            }
        }
    }
    
    
    func updateValues() {
        let formatter = NumberFormatter()
        formatter.locale = Locale.autoupdatingCurrent

        
        var billValue = formatter.number(from: billAmount.text!)?.doubleValue
        if(billValue == nil)
        {
            billValue = 0.0
        }
       // var billValue : Double = (billAmount.text as NSString ).doubleValue
        let tipArray = [0.1, 0.15, 0.2]
        let tipValue = billValue! * tipArray[tipPercentage.selectedSegmentIndex]
        let totalValue = billValue! + tipValue
        
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.usesGroupingSeparator = true
        tipLabel.text = formatter.string(from: tipValue as NSNumber)
        totalAmountLabel.text = formatter.string(from: totalValue as NSNumber)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "settingsSegue") {
            let destinationVC = segue.destination as? SettingsViewController
            
            if (destinationVC != nil){
                destinationVC?.defaultTipSelectionIndex = defaultTipIndex
                destinationVC?.isThemeDark = defaultTiptheme
            }
            
        }
    }
    
    // Override viewWillAppear to update tip selection and corresponding values.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tipPercentage.selectedSegmentIndex = defaultTipIndex
        updateValues()
        updateThemeColors()
    }
    
    // This function updates color of all elements in the tip calculator view
    func updateThemeColors() {
        if defaultTiptheme {
            self.view.backgroundColor = UIColor(rgb: 0x3975ad)
            let themeTextColor = UIColor(rgb: 0xebd8d1)

            
            billAmount.textColor = themeTextColor
            billAmount.tintColor = themeTextColor
            tipLabel.textColor = themeTextColor
            totalAmountLabel.textColor = themeTextColor
            tipText.textColor = themeTextColor
            totalText.textColor = themeTextColor
            
            tipPercentage.backgroundColor = UIColor(rgb: 0x2c4e78)
            tipPercentage.tintColor = themeTextColor
        }
        else
        {
            self.view.backgroundColor = UIColor(rgb:0xdae6ed)
            let lightThemeTextColor = UIColor(rgb: 0x594466)
            
            
            billAmount.textColor = lightThemeTextColor
            billAmount.tintColor = lightThemeTextColor
            tipLabel.textColor = lightThemeTextColor
            totalAmountLabel.textColor = lightThemeTextColor
            tipText.textColor = lightThemeTextColor
            totalText.textColor = lightThemeTextColor
            
            tipPercentage.backgroundColor = UIColor(rgb: 0xa5b7cc)
            tipPercentage.tintColor = lightThemeTextColor
        }
    }
    

}
