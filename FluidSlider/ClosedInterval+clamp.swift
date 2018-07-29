//
//  ClosedInterval+clamp.swift
//  FluidSlider
//
//  Created by Isaac Weisberg on 7/29/18.
//  Copyright © 2018 Isaac Weisberg. All rights reserved.
//

import Foundation

// Immature copy-paste
extension ClosedRange {
    func clamp(_ value : Bound) -> Bound {
        return self.lowerBound > value ? self.lowerBound
            : self.upperBound < value ? self.upperBound
            : value
    }
}
