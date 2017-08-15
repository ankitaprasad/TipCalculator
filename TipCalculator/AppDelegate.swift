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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Get the main tip controller so that we can set the "maintainState" boolean. Setting this to true tells the controller to
        // get the value in billAmount on last close.
        let appDelegate  = UIApplication.shared.delegate as? AppDelegate
        let viewController = appDelegate!.window!.rootViewController as? UINavigationController
        let topController = viewController?.topViewController as? TipCalculatorViewController
        
        let userDefaults = UserDefaults.standard
        if let exitTimestamp = userDefaults.object(forKey: "exitTimestamp") as? Date {
            let presentDate = Date()
            let difference = presentDate.timeIntervalSince(exitTimestamp)
            if (difference < 600){
                topController?.maintainState = true
                return true
            }

        }
        topController?.maintainState = false
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
     
        // Get the tip view controller so that we can store the last bill amount in user defaults
        let appDelegate  = UIApplication.shared.delegate as? AppDelegate
        let viewController = appDelegate!.window!.rootViewController as? UINavigationController
        let topController = viewController?.topViewController as? TipCalculatorViewController
        
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(topController?.billAmount.text, forKey: "lastBillState")
        
        // Set the time of exit in user defaults.
        let date = Date()
        userDefaults.set(date, forKey: "exitTimestamp")
        
        userDefaults.synchronize()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

