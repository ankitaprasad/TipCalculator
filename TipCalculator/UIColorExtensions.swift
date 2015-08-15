//
//  UIColorExtensions.swift
//  TipCalculator
//
//  Created by Ankita Prasad on 8/14/15.
//  Copyright (c) 2015 Ankita Prasad. All rights reserved.
//

// UIColorExtensions.swift 
// Got this from stack overflow
import Foundation
import UIKit

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
