//
//  Button.swift
//  MovaStream
//
//  Created by HauNguyen on 27/04/2566 BE.
//

import UIKit

// Custom button
class MasterButton: UIButton {
    
    func setImage(_ image: UIImage?,
                  renderingMode: UIImage.RenderingMode? = .alwaysOriginal,
                  imagePlace: NSDirectionalRectEdge? = .all,
                  color: UIColor? = .blue,
                  size: CGFloat? = nil,
                  imagePadding: CGFloat? = 0,
                  for state: UIControl.State)
    {
        self.configuration?.image = image?.resized(to: CGSize(width: size ?? 24.0, height: size ?? 24.0))?.withTintColor(color!, renderingMode: renderingMode!)
        self.configuration?.baseBackgroundColor = .transparent
        self.configuration?.imagePlacement = imagePlace!
        self.configuration?.imagePadding = imagePadding!
    }
    
    func setTitle(_ title: String?,
                  font: UIFont? = nil,
                  textColor: UIColor? = .blue,
                  titlePadding: CGFloat? = 0,
                  titleAlignment: UIButton.Configuration.TitleAlignment? = .center,
                  shadow: UIColor? = nil,
                  for state: UIControl.State)
    {
        self.setTitle(title, for: state)
        self.titleLabel?.font = font
        self.setTitleColor(textColor, for: state)
        self.setTitleShadowColor(shadow, for: state)
        self.configuration?.titlePadding = titlePadding!
        self.configuration?.titleAlignment = titleAlignment!
    }
    
    func setBackground(strokeColor: UIColor?, strokeWidth: CGFloat? = 2, strokeOutset: CGFloat? = 0, cornerRadius: CGFloat? = 0, for state: UIControl.State) {
        
        self.configuration?.background.strokeColor = strokeColor
        self.configuration?.background.strokeWidth = strokeWidth!
        self.configuration?.background.cornerRadius = cornerRadius!
        self.configuration?.background.strokeOutset = strokeOutset!
    }
    
    func setBackground(_ color: UIColor?, cornerRadius: CGFloat? = 0, for state: UIControl.State) {
        self.configuration?.background.cornerRadius = cornerRadius!
        self.configuration?.background.backgroundColor = color
    }
    
    func setBackground(_ view: UIView?, cornerRadius: CGFloat? = 0, for state: UIControl.State) {
        self.configuration?.background.customView = view
        self.configuration?.background.cornerRadius = cornerRadius!
    }
}
