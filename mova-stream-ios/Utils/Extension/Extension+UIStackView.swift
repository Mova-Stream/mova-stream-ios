//
//  Extension+StackView.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import UIKit

extension UIStackView {
    
    func vStack() {
        self.axis = .vertical
        self.alignment = .center
    }
    
    convenience init(subViews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 8, distribution: UIStackView.Distribution = .fill) {
        self.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = .fill
        self.translatesAutoresizingMaskIntoConstraints = false
        subViews.forEach { view in
            self.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}
