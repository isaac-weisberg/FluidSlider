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
    internal var knob: FluidSliderKnob!
    public var panGestureRecognizer = UIPanGestureRecognizer()
    private var knobCenterXConstraint: NSLayoutConstraint!
    private var knobCenterYConstraint: NSLayoutConstraint!
    private var panInKnob = false
    private var lastPosition: CGFloat!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @objc func didPan(_ sender: UIPanGestureRecognizer) {
        if case .began = sender.state {
            panInKnob = knob.bounds.contains(sender.location(in: knob))
        }
        guard panInKnob else {
            return
        }
        
        let position = sender.location(in: nil).x
        if case .changed = sender.state {
            let delta = position - lastPosition
            let newConstraintValue = knobCenterXConstraint.constant + delta
            let width = bounds.width * 0.5
            let clampedValue = (-width...width).clamp(newConstraintValue)
            knobCenterXConstraint.constant = clampedValue
            
        }
        lastPosition = position
    }
}

private extension FluidSlider {
    func setup() {
        setupLowerBound()
        setupUpperBound()
        setupKnob()
        setupGestureRecognizer()
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
    
    func setupKnob() {
        let height = bounds.height
        knob = FluidSliderKnob(frame: CGRect(x: 0, y: 0, width: height, height: height))
        addSubview(knob)
        knobCenterXConstraint =
            NSLayoutConstraint(item: knob, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        knobCenterXConstraint.priority = .defaultHigh
        knobCenterYConstraint =
            NSLayoutConstraint(item: knob, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: knob, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: knob, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .greaterThanOrEqual, toItem: knob, attribute: .trailing, multiplier: 1, constant: 0),
            knobCenterXConstraint,
            knobCenterYConstraint,
        ])
    }
    
    func setupGestureRecognizer() {
        addGestureRecognizer(panGestureRecognizer)
        panGestureRecognizer.addTarget(self, action: #selector(didPan(_:)))
    }
}
