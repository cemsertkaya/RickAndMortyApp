//
//  UI+.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 23.06.2022.
//

import Foundation
import UIKit

extension UIColor
{
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor
    {
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}

extension UIView{
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
           clipsToBounds = true
           layer.cornerRadius = radius
           layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
     }
}
