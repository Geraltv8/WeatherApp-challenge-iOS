//
//  UiView+Ext.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation
import UIKit

public extension UIView {
    func asBullet() {
        self.layer.cornerRadius = self.frame.size.width / 2.0
        self.clipsToBounds = true
    }
    
    func rounded(radius: Float) {
        self.layer.cornerRadius = CGFloat(radius)
        self.clipsToBounds = true
    }
    
    func dropShadow(color: UIColor = .black, opacity: Double = 0.2, radius: Double = 1.0, offset: CGSize = CGSize(width: 0, height: 0.5), shouldRasterize: Bool = false) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = Float(opacity)
        self.layer.shadowRadius = CGFloat(radius)
        if shouldRasterize {
            self.layer.rasterizationScale = UIScreen.main.scale
            self.layer.shouldRasterize = true
        }
    }
    
    func border(width: Double, color: UIColor) {
        self.layer.borderWidth = CGFloat(width)
        self.layer.borderColor = color.cgColor
    }
}
