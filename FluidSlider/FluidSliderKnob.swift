//
//  FluidSliderKnob.swift
//  FluidSlider
//
//  Created by Isaac Weisberg on 7/29/18.
//  Copyright © 2018 Isaac Weisberg. All rights reserved.
//

import UIKit

class FluidSliderKnob: UIView {
    let label = UILabel()
    let circleLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override var bounds: CGRect {
        get {
            return super.bounds
        }
        set {
            super.bounds = newValue
            update()
        }
    }
}

private extension FluidSliderKnob {
    func setup() {
        setupSelf()
        setupLayers()
        setupLabel()
    }
    
    func setupSelf() {
        let aspectRatio = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        aspectRatio.isActive = true
    }
    
    func setupLayers() {
        layer.addSublayer(circleLayer)
        update()
    }
    
    func setupLabel() {
        #if DEBUG
            label.text = "DEB"
        #endif
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        let centerVertical = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        centerVertical.isActive = true
        let leading = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        leading.isActive = true
        let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: label, attribute: .trailing, multiplier: 1, constant: 0)
        trailing.isActive = true
    }
    
    func update() {
        let radius = bounds.width
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: radius)
        circleLayer.path = path.cgPath
    }
}
