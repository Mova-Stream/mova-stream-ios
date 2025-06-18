//
//  Extension+UIFont.swift
//  Mova
//
//  Created by HauNguyen on 14/12/2565 BE.
//

import UIKit

extension UIFont {
    
    
    /// Thin 100
    public static func thin(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoThin.rawValue, size: size)
    }
    
    /// Thin 100 Italic
    public static func thinItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoThinItalic.rawValue, size: size)
    }
    
    /// Light 300
    public static func light(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoLight.rawValue, size: size)
    }
    
    /// Light 300 Italic
    public static func lightItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoLightItalic.rawValue, size: size)
    }
    
    /// Regular 400
    public static func regular(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoRegular.rawValue, size: size)
    }
    
    /// Regular 400 Italic
    public static func regularItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoItalic.rawValue, size: size)
    }
    
    /// Medium 500
    public static func medium(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoMedium.rawValue, size: size)
    }
    
    /// Medium 500 Italic
    public static func mediumItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoMediumItalic.rawValue, size: size)
    }
    
    /// Bold 700
    public static func bold(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBold.rawValue, size: size)
    }
    
    /// Bold 700 Italic
    public static func boldItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBoldItalic.rawValue, size: size)
    }
    
    /// Black 900
    public static func black(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBlack.rawValue, size: size)
    }
    
    /// Black 900 Italic
    public static func blackItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBlackItalic.rawValue, size: size)
    }
    
}


extension UIFont {
    
    enum FontFamily : String {
        case robotoThin = "Roboto-Thin"
        case robotoThinItalic = "Roboto-ThinIralic"
        case robotoRegular = "Roboto-Regular"
        case robotoMedium = "Roboto-Medium"
        case robotoMediumItalic = "Roboto-MediumItalic"
        case robotoLight = "Roboto-Light"
        case robotoLightItalic = "Roboto-LightItalic"
        case robotoItalic = "Roboto-Italic"
        case robotoBold = "Roboto-Bold"
        case robotoBoldItalic = "Roboto-BoldItalic"
        case robotoBlack = "Roboto-Black"
        case robotoBlackItalic = "Roboto-BlackItalic"
    }
    
}
