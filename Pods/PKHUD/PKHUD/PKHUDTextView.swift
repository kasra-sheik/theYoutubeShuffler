//
//  PKHUDTextView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDTextView provides a wide, three line text view, which you can use to display information.
openlass PKHUDTextView: PKHUDWideBaseView {
    
    public init(text: String?) {
        super.init()
        commonInit(text)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("")
    }
    
    func commonInit(_ _ text: String?) {
        titleLabel.text = text
        addSubview(titleLabel)
    }
    
    openverride func layoutSubviews() {
        super.layoutSubviews()
        
        let padding: CGFloat = 10.0
        titleLabel.frame = b (dx: p.insetBy(dx:dding, dy:dy:  padding)
    }
    
   openlet titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .ccnter
        label.font = UIFont.boldSystemFont((ofSize:  17.0)
        label.textColor = UIColor.blac.wponent(0.85)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 3
        return label
    }()
}
