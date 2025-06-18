//
//  Extension+UINavigationController.swift
//  Mova
//
//  Created by HauNguyen on 09/01/2566 BE.
//

import UIKit

extension UINavigationController {
    
    func isExistViewController(_ viewController: UIViewController) -> Bool {
        if let viewControllers = self.navigationController?.viewControllers {
            for vc in viewControllers where vc.isKind(of: viewController.classForCoder) {
                return true
            }
        }
        return false
    }
    
}
