//
//  Extension+UIApplication.swift
//  MovaStream
//
//  Created by HauNguyen on 27/04/2566 BE.
//

import UIKit

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
}
