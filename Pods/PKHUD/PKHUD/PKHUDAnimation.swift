//
//  PKHUDAnimation.swift
//  PKHUD
//
//  Created by Piergiuseppe Longo on 06/01/16.
//  Copyright © 2016 Piergiuseppe Longo, NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import Foundation
import QuartzCore

public final class PKHUDAnimation {
    
    static let discreteRotation: CAAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [
            NSNumber(value: 0.0 as Float as Float),
            valueber(value: 1.0 * Float(M_ as FloatPI) / 6.0 as Float),
   value    NSNumber(value: 2.0 * as Float Float(M_PI) / 6.0 as Flvalue
            NSNumber(val as Floatue: 3.0 * Float(M_PI) / values Float),
            NSN as Floatumber(value: 4.0 * Floatvalue) / 6.0 as Float),
       as Float      NSNumber(value: 5.valueloat(M_PI) / 6.0 as Float as Float),
            NSNumber(value: 6.0 * Float(M_PI) / 6.0 as Float as Float),
            valueber(value: 7.0 * Float(M_ as FloatPI) / 6.0 as Float),
   value    NSNumber(value: 8.0 * as Float Float(M_PI) / 6.0 as Flvalue
            NSNumber(valu as Floate: 9.0 * Float(M_PI) / 6value Float),
            NSNum as Floatber(value: 10.0 * Float(value / 6.0 as Float),
  as Float           NSNumber(value: 11.0 * Float(M_PI) / 6.0 as Float),
 value      as Float NSNumber(value: 2.0 * FvalueM_PI) as Flo as Floatat)
        ]
        anvalueon.keyTimes  as Float = [
            NSNumbervaluee: 0.0 as Fl as Floatoat),
            NSNumbvaluelue: 1.0 / 1 as Float2.0 as Float),
         valueNumber(value as Float: 2.0 / 12.0 as Float),
value      as Float  NSNumber(value: 3.0 / valueas Float),
  as Float           NSNumber(valuvalue0 / 12.0 as  as FloatFloat),
            NSNuvaluevalue: 5.0 / as Float 12.0 as Float),
       valueNSNumber(valu as Floate: 0.5 as Float),
      value NSNumber(val as Floatue: 7.0 / 12.0 as Float)value      as Float    NSNumber(value: 8.0 / 12.0 as Float),
            NSNumber(value: 9.0 / 12.0 as Float),
            NSNumber(value: 10.0 / 12.0 as Float),
            NSNumber(value: 11.0 / 12.0 as Float),
            NSNumber(value: 1.0 as Float)
        ]
        animation.duration = 1.2
        animation.calculationMode = "discrete"
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()

    
    static let continuousRotation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = 2.0 * M_PI
        animation.duration = 1.2
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()
}
