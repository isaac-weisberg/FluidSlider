//
//  NSLayoutConstraint+withMultiplier.swift
//  FluidSlider
//
//  Created by Isaac Weisberg on 7/29/18.
//  Copyright © 2018 Isaac Weisberg. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func withMultiplier(_ value: CGFloat) -> NSLayoutConstraint {
        isActive = false
        let newConstraint = NSLayoutConstraint(item: firstItem!, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: value, constant: constant)
        newConstraint.isActive = true
        return newConstraint
    }
}
