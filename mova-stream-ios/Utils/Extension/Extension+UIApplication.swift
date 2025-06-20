//
//  Extension+UIApplication.swift
//  MovaStream
//
//  Created by HauNguyen on 27/04/2566 BE.
//

import UIKit

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        return connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first }
            .first(where: { $0.isKeyWindow })
    }
    
    static var statusBarHeight: CGFloat {
        let height = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.statusBarManager?.statusBarFrame.height ?? 0
        return height
    }
}
