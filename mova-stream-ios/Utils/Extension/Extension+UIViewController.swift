//
//  Extension+UIViewController.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension UIViewController {
    
    // MARK: - Navigation Bar
    // Sets the navigation bar to be transparent and hides the shadow
    /**
        Using example:
        ```swift
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.setNavigationBarTransparent()
         }
        ```
     */
    func setNavigationBarTransparent() {
        // Make the Navigation Bar background transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    // Remove 'Back' text and Title from Navigation Bar
    /**
        Using example:
        ```swift
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.removeBackTextAndTitle()
         }
        ```
     */
    func setNavigationBackTextAndTitleHidden() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.title = ""
    }
    
    // Hide the navigation bar completely
    /**
        Using example:
        ```swift
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.hideNavigationBar()
         }
        ```
     */
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
