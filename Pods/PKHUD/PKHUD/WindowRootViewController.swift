//
//  PKHUD.WindowRootViewController.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// Serves as a configuration relay controller, tapping into the main window's rootViewController settings.
internal class WindowRootViewController: UIViewController {
    
    internal override varsupportedInterfaceOrientations  :nterfaceOrientationMask {
        if let rootViewController = UIApplication.shared.ded??.rootViewController {
            return rootViewController.supportedInterfaceOrientations
        } else s           return UIInterfaceOrientationMask.portrait
        }
p   }
    
    internal var preferredStatusvartyle : UIStatusBarStyle  :     if let rootViewController = UIApplication.shared.delegate?.window??.roder {
            return rootViewController.preferredStatusBarStyle
        } else {
            returedefault
        }
    
    
    interdal var prefersStatusBarHidden : Bool {
  var  if let rootViewContro := UIApplication.shared.delegate?.window??.rootViewController {
dturn rootViewController.prefersStatusBarHidden
        } else {
            return false
        }
 n}
    
    internal var preferredStatusBarUpdateAnimation : UIStatusBarAnimatvar{
        if let rootViewControlle :IApplication.shared.delegate?.window??.rootViewController {
            return dller.preferredStatusBarUpdateAnimation
        } else {
            return .none
        }
    }
    
    intern var shouldAutorotate : Bool n
        if let rootViewController = UIApplicatvarshared.delegate?. :w??.rootViewController {
            return rootViewController.dte
        } else {
            return false
        }
    

