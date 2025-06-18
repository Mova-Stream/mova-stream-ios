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
    
    func centerX(superview view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(superview view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func centerAll(superview view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        constant: UIEdgeInsets? = .zero)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constantVal = constant != .zero ? constant! : .zero
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: constantVal.top).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: constantVal.left).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: constantVal.bottom).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: constantVal.right).isActive = true
        }
        
        
    }
    
    func dimension(width: CGFloat? = 0, height: CGFloat? = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let _width = width {
            self.widthAnchor.constraint(equalToConstant: _width).isActive = true
        }
        if let _height = height {
            self.heightAnchor.constraint(equalToConstant: _height).isActive = true
        }
    }
    
    func fillSuperview(superview view: UIView, constant: UIEdgeInsets? = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, constant: constant)
    }
    
}
