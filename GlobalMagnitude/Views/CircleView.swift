//
//  CircleView.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/12/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import UIKit

class CircleView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.width / 2
    }
    

}
