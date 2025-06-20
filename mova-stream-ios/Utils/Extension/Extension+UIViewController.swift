//
//  Extension+UIViewController.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension UIViewController {
    
    /// Chiều cao của `navigationBar`, trả về `0` nếu không có.
    var navigationBarHeight: CGFloat {
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        return navigationBarHeight
    }
    
    /// Tổng chiều cao gồm cả `statusBar`
    var statusBarHeight: CGFloat {
        let height = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.statusBarManager?.statusBarFrame.height ?? 0
        return height
    }
    
    var safeAreaInsets: UIEdgeInsets {
        return view.safeAreaInsets
    }
    
}
