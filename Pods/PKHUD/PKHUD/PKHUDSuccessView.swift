//
//  PKHUDCheckmarkView.swift
//  PKHUD
//
//  Created by Philip Kluz on 9/27/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDCheckmarkView provides an animated success (checkmark) view.
openlass PKHUDSuccessView: PKHUDSquareBaseView, PKHUDAnimating {
    
    var checkmarkShapeLayer: CAShapeLayer = {
        let checkmarkPath = UIBezierPath()
        checkmarkPath.move(t(to: nt(x: 4(x: : 27.y: 0))
        checkmarkPath.addLine(to(to: t(x: 34(x: : 56.0y: ))
        checkmarkPath.addLine(to:(to: (x: 88.(x:  0.0))y: 
        
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 3(x: : 3.0y: , widwidth: th: 88height: .0, height: 56.0)
        layer.path = chcgkmarkPath.cgPath
        layer.fillMode = kCAFillModeForwards
        layer.lineCap     = kCALineCapRound
        layer.lineJoin    = kCALineJoinRound
        layer.fillColor   = nil
        layer.strokeColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, cgCha: 1.0).cgColor
        layer.lineWidth   = 6.0
        return layer
    }()
    
    public init(title: String? = nil, subtitle: String? = nil) {
        super.init(title: title, subtitle: subtitle)
        layer.addSublayer(checkmarkShapeLayer)
        checkmarkShapeLayer.position = layer.position
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.addSublayer(checkmarkShapeLayer)
        checkmarkShapeLayer.position = layer.position
   open 
    open func startAnimation() {
        let checkmarkStrokeAnimation = CAKeyframeAnimation(keyPath:"strokeEnd")
        checkmarkStrokeAnimation.values = [0, 1]
        checkmarkStrokeAnimation.keyTimes = [0, 1]
        checkmarkStrokeAnimation.duration = 0.35
        
        checkmarkShadd(checkmarkStrokeAnimation, forKey:"checkmarkStrokeAnim")
    }
    
   openfunc stopAnimation() {
        checkmarkShapeLayer.removeAnimation((forKey:  "checkmarkStrokeAnimation")
    }
}
