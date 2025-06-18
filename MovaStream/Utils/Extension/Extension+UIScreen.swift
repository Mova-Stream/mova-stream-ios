//
//  Extension+UIScreen.swift
//  Mova
//
//  Created by HauNguyen on 30/12/2565 BE.
//

import UIKit

extension UIScreen {
    
    static var topWindow: UIWindow? {
        return UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
    
    static var edges: UIEdgeInsets {
        return self.topWindow?.safeAreaInsets ?? .zero
    }
    
    static var size: CGSize {
        return self.main.bounds.size
    }
    
}
