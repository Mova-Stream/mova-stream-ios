//
//  Extension+UIView.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension UIView {
    
    var safeAreaBottom: CGFloat {
        if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindowInConnectedScenes {
                return window.safeAreaInsets.bottom
            }
        }
        return 0
    }
    
    var safeAreaTop: CGFloat {
        if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindowInConnectedScenes {
                return window.safeAreaInsets.top
            }
        }
        return 0
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    class func blurView(frame: CGRect) -> UIView {
        let effectView = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        effectView.effect = blurEffect
        effectView.frame = frame
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return effectView
    }
    
    func addDrawRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.clear.cgColor
    }
}

extension UIView {
    
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var cardStyleWithOffSet: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = 5.0
            layer.borderColor  =  UIColor.clear.cgColor
            layer.borderWidth = 5.0
            layer.shadowOpacity = 0.5
            layer.shadowColor =  UIColor.lightGray.cgColor
            layer.shadowRadius = 5.0
            layer.shadowOffset = CGSize(width: newValue, height: cardStyleWithOffSet)
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var lineGradients: Bool {
        get {
            return true
        }
        set {
            setNeedsLayout()
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.startPoint = CGPoint(x:0.0, y:0.5)
            gradient.endPoint = CGPoint(x:1.0, y:0.5)
            gradient.colors = [UIColor.white.cgColor.copy(alpha: 0)!, UIColor.white.cgColor, UIColor.white.cgColor,  UIColor.white.cgColor.copy(alpha: 0)!]
            gradient.locations = [0.0, 0.4, 0.6, 1.0]
            self.layer.insertSublayer(gradient, at: 0)
        }
    }
    
    func gradients(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setGradients(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at:0)
    }
    
}
