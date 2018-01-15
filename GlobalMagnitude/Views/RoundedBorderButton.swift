//
//  RoundedBorderButton.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/12/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import UIKit

class RoundedBorderButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.lightertBlue().cgColor
        self.layer.backgroundColor = UIColor.darkerBlue().cgColor
        self.layer.borderWidth = 2.0
    }

}
