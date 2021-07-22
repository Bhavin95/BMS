//
//  UIViewExtension.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import UIKit

public extension UIView {

func addGradientLayer(_ upperGradientColor: UIColor, _ lowerGradientColor: UIColor) {
       let gradient = CAGradientLayer()
       gradient.frame = self.bounds
       gradient.colors = [upperGradientColor.cgColor, lowerGradientColor.cgColor]
       self.layer.insertSublayer(gradient, at: 0)
   }
}
