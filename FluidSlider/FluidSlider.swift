//
//  FluidSlider.swift
//  FluidSlider
//
//  Created by Isaac Weisberg on 7/28/18.
//  Copyright © 2018 Isaac Weisberg. All rights reserved.
//

import UIKit

public class FluidSlider: UIView {
    public let lowerBoundLabel = UILabel()
    public let upperBoundLabel = UILabel()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
}

private extension FluidSlider {
    func setup() {
        setupLowerBound()
        setupUpperBound()
    }
    
    func setupLowerBound() {
        #if DEBUG
            lowerBoundLabel.text = "DEBUG"
        #endif
        lowerBoundLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lowerBoundLabel)
        let leading = NSLayoutConstraint(item: lowerBoundLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 8)
        leading.isActive = true
        let verticalCenter = NSLayoutConstraint(item: lowerBoundLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        verticalCenter.isActive = true
    }
    
    func setupUpperBound() {
        #if DEBUG
            upperBoundLabel.text = "DEBUG"
        #endif
        upperBoundLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(upperBoundLabel)
        let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: upperBoundLabel, attribute: .trailing, multiplier: 1, constant: 8)
        trailing.isActive = true
        let verticalCenter = NSLayoutConstraint(item: upperBoundLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        verticalCenter.isActive = true
    }
}
