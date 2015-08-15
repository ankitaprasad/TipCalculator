//
//  AppDelegate.swift
//  TipCalculator
//
//  Created by Ankita Prasad on 8/13/15.
//  Copyright (c) 2015 Ankita Prasad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Get the main tip controller so that we can set the "maintainState" boolean. Setting this to true tells the controller to
        // get the value in billAmount on last close.
        let appDelegate  = UIApplication.sharedApplication().delegate as? AppDelegate
        let viewController = appDelegate!.window!.rootViewController as? UINavigationController
        let topController = viewController?.topViewController as? TipCalculatorViewController
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        if let exitTimestamp = userDefaults.objectForKey("exitTimestamp") as? String {
            let formatter = NSDateFormatter()
            var exitDate = formatter.dateFromString(exitTimestamp)
            if (exitDate != nil) {
                var presentDate = NSDate()
                var difference = presentDate.timeIntervalSinceDate(exitDate!)
                if (difference > 600){
                    topController?.maintainState = true
                }
            }
        }
        else {
            topController?.maintainState = false
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
     
        // Get the tip view controller so that we can store the last bill amount in user defaults
        let appDelegate  = UIApplication.sharedApplication().delegate as? AppDelegate
        let viewController = appDelegate!.window!.rootViewController as? UINavigationController
        let topController = viewController?.topViewController as? TipCalculatorViewController
        
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.setObject(topController?.billAmount.text, forKey: "lastBillState")
        
        // Set the time of exit in user defaults.
        var date = NSDate()
        let formatter = NSDateFormatter()
        // formatter.dateStyle = .FullStyle
        var dateString = formatter.stringFromDate(date)
        println(dateString)
        userDefaults.setObject(dateString, forKey: "exitTimestamp")
        
        userDefaults.synchronize()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

