//
//  Extension+UIColor.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat? = 1.0) {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            if (cString.hasPrefix("#")) {
                cString.remove(at: cString.startIndex)
            }
            if ((cString.count) != 6) {
                self.init()
            }
            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)
        self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: alpha!
            )
    }
}

///* Colors */
//  --primary-red: #e21221;
//  --grey-light-025: rgb(144, 144, 144, 0.25);
//  --grey-light-05: rgb(144, 144, 144, 0.5);
//  --grey-light-075: rgb(144, 144, 144, 0.75);
//  --grey-light: rgb(144, 144, 144);
//  --grey-025: rgb(48, 48, 48, 0.25);
//  --grey-05: rgb(48, 48, 48, 0.5);
//  --grey-075: rgb(48, 48, 48, 0.75);
//  --grey: rgb(48, 48, 48);
//  --grey-dark-025: rgb(29, 29, 29, 0.25);
//  --grey-dark-05: rgb(29, 29, 29, 0.5);
//  --grey-dark-075: rgb(29, 29, 29, 0.75);
//  --grey-dark: rgb(29, 29, 29);
//  --background-page: rgb(20, 20, 20);
//
//  /* Padding */
//  --padding-container: 2.5rem; /* 40px */
//  --padding-element: 1.25rem; /* 20px */
//
//  /* Size icon */
//  --icon-small: 0.875rem; /* 14px */
//  --icon-primary: 1.25rem; /* 20px */
//  --icon-medium: 1.75rem; /* 28px */
//  --icon-large: 2.25rem; /* 36px */

extension UIColor {
    
    /// Main color
    static var mainColor: UIColor {
        return UIColor(hex: "E21220")
    }
    
    /// Secondary color
    static var secondaryColor: UIColor {
        return UIColor(hex: "959192")
    }
    
    /// Main color
    static var primaryRed: UIColor {
        return UIColor(hex: "E21221")
    }
    
    /// Main color with alpha
    static func primaryRed(alpha: CGFloat? = 1.0) -> UIColor {
        return UIColor(hex: "E21221", alpha: alpha)
    }
    
    /// Grey
    static var transparent: UIColor {
        return UIColor(hex: "#000000", alpha: 0)
    }
    
    /// Grey
    static var grey: UIColor {
        return UIColor(hex: "#303030")
    }
    
    /// Grey with alpha
    static func grey(alpha: CGFloat? = 1.0) -> UIColor {
        return UIColor(hex: "#303030", alpha: alpha)
    }
    
    /// Grey dark
    static var greyDark: UIColor {
        return UIColor(hex: "#1D1D1D")
    }
    
    /// Grey dark with alpha
    static func greyDark(alpha: CGFloat? = 1.0) -> UIColor {
        return UIColor(hex: "#1D1D1D", alpha: alpha)
    }
    
    /// Grey light
    static var greyLight: UIColor {
        return UIColor(hex: "#909090")
    }
    
    /// Grey light with alpha
    static func greyLight(alpha: CGFloat? = 1.0) -> UIColor {
        return UIColor(hex: "#909090", alpha: alpha)
    }
    
    /// Text color
    static var textColor: UIColor {
        return UIColor(hex: "FFFFFF")
    }
    
    /// Textfield placeholder
    static var placeholderColor: UIColor {
        return UIColor(hex: "9F9FA2")
    }
    
}


extension [UIColor] {
    
    var toCGColors: [CGColor] {
        
        var colors = [CGColor]()
        
        if self.count > 1 {
            colors = self.map({$0.cgColor})
        } else {
            colors.append(contentsOf: self.map({$0.cgColor}))
        }
        
        return colors
    }
    
}

