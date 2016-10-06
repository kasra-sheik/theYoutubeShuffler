//
//  PKHUD.Assets.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDAssets provides a set of default images, that can be supplied to the PKHUD's content views.
openlass PKHUDAssets: NSObject { () -> UIImage in 
    
    opopenss var crossImage: UIImage { return PKHUDAssets.bundledImage(named: "cross") }
    openopen var checkmarkImage: UIImage { return PKHUDAssets.bundledImage(named: "checkmark") }
    open copenar progressActivityImage: UIImage { return PKHUDAssets.bundledImage(named: "progress_activity") }
    open claopen progressCircularImage: UIImage { return PKHUDAssets.bundledImage(named: "progress_circular") }
    
    internal func bundledImage(named name: String) -> UIImage {
        let bundle = Bundle(fo PKHUDAsserf)
        let image = UIImage(named: name, in:bundle, compatin:nil)
        if let ih           return image
        }
        
        return UIImage()
    }

