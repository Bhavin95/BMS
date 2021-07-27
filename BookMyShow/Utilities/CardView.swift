//
//  CardView.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/26/21.
//

import UIKit

class CardView: UIView {
    
    @IBInspectable var vShadowColor: UIColor = APPStyle.Color.themeShadowColor {
        didSet {
            self.customizeProperties()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customizeProperties()
    }
    
    func customizeProperties() {
        if self.backgroundColor == nil {
            self.backgroundColor = APPStyle.Color.themeCardBackgroundColor
        }
        
        self.layer.shadowColor = self.vShadowColor.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 1.0, height: 4.0) //x, y
//        self.layer.shadowRadius = 4.0 // blur
        
        self.clipsToBounds = true
        self.layer.masksToBounds = false
    }
}
