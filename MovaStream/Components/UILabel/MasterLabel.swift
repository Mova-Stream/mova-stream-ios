//
//  MasterLabel.swift
//  MovaStream
//
//  Created by HauNguyen on 30/04/2566 BE.
//

import UIKit

class MasterLabel: UILabel {
    
    private var edgesInset: UIEdgeInsets = .zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -edgesInset.top,
                                          left: -edgesInset.left,
                                          bottom: -edgesInset.bottom,
                                          right: -edgesInset.right)
        return textRect.inset(by: invertedInsets)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: self.edgesInset))
    }
    
    public func setEdgeInsets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.edgesInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

}

