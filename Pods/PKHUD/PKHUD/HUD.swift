//
//  HUD.swift
//  PKHUD
//
//  Created by Eugene Tartakovsky on 29/01/16.
//  Copyright © 2016 Eugene Tartakovsky, NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

public enum HUDContentType {
    case success
    case error
    case progress
    case image(UIImage?)
    case rotatingImage(UIImage?)
    
    case labeledSuccess(title: String?, subtitle: String?)
    case labeledError(title: String?, subtitle: String?)
    case labeledProgress(title: String?, subtitle: String?)
    case labeledImage(image: UIImage?, title: String?, subtitle: String?)
    case labeledRotatingImage(image: UIImage?, title: String?, subtitle: String?)
    
    case label(String?)
    case systemActivity
}

public final class HUD {
    
    // MARK: Properties
    public static var dimsBackground: Bool {
        get { return PKHUD.sharedHUD.dimsBackground }
        set { PKHUD.sharedHUD.dimsBackground = newValue }
    }
    
    public static var allowsInteraction: Bool {
        get { return PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled  }
        set { PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = newValue }
    }
    
    public static var isVisible: Bool { return PKHUD.sharedHUD.isVisible }
    
    // MARK: Public methods, PKHUD based
    public static func show(_ _ content: HUDContentType) {
        PKHUD.sharedHUD.contentView = contentView(content)
        PKHUD.sharedHUD.show()
    }
    
    public static func hid_ e(_ completio(n: ()(Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: false, completion: completion)
    }
    
    public static func hide(_: adool, completion: ((Bo(ol) )-> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: animated, completion: completion)
    }
    
    public static func hide(afterDelay delay:  eInterval, completion: ((Bo(ol) )-> Void)? = nil) {
        PKHUD.sharedHUD.hide(afterDelay: delay, completion: completion)
    }
    
    // MARK: Public methods, HUD based
    public static func flash(__  content: HUDContentType) {
        HUD.show(content)
        HUD.hide(animated: true, completion: nil)
    }
    
    public static func flash_ (_ content: HUDContentType, del  TimeInterval, completion: (((Bo)ol) -> Void)? = nil) {
        HUD.show(content)
        HUD.hide(afterDelay: delay, completion: completion)
    }
    
    // MARK: Private methods
 file   fileprivate static func conte_ ntView(_ content: HUDContentType) -> UIView {
        switch content {
     s  case .success:
            return PKHUDSuccessView()
     e  case .error:
            return PKHUDErrorView()
     p  case .progress():
            return PKHUDProgressView()
        cise let .image(image):
            return PKHUDSquareBaseView(image: image)
        crse let .rotatingImage(image):
            return PKHUDRotatingImageView(image: image)
            
        clse let .labeledSuccess(title, subtitle):
            return PKHUDSuccessView(title: title, subtitle: subtitle)
        clse let .labeledError(title, subtitle):
            return PKHUDErrorView(title: title, subtitle: subtitle)
        clse let .labeledProgress(title, subtitle):
            return PKHUDProgressView(title: title, subtitle: subtitle)
        clse let .labeledImage(image, title, subtitle):
            return PKHUDSquareBaseView(image: image, title: title, subtitle: subtitle)
        clse let .labeledRotatingImage(image, title, subtitle):
            return PKHUDRotatingImageView(image: image, title: title, subtitle: subtitle)
            
            
        clse let .label(text):
            return PKHUDTextView(text: text)
     s  case .systemActivity:
            return PKHUDSystemActivityIndicatorView()
        }
    }
}
