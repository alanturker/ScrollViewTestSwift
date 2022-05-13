//
//  viewExtenison.swift
//  ScrollViewExample
//
//  Created by alanturker on 13.05.2022.
//

import UIKit

public extension UIView {
    func addCorners(corners: UIRectCorner, radius: CGFloat) {
            self.clipsToBounds = true
            layer.cornerRadius = radius
            var mask = CACornerMask()
            if corners.contains(.topLeft){
                mask.insert(.layerMinXMinYCorner)
            }
            if corners.contains(.bottomRight) {
                mask.insert(.layerMaxXMaxYCorner)
            }
            if corners.contains(.bottomLeft) {
                mask.insert(.layerMinXMaxYCorner)
            }
            if corners.contains(.topRight) {
                mask.insert(.layerMaxXMinYCorner)
            }
            layer.maskedCorners = mask
    }
}
