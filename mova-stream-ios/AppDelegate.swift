//
//  AppDelegate.swift
//  MovaStream
//
//  Created by HauNguyen on 26/04/2566 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let _window = UIWindow(frame: UIScreen.main.bounds)
        
        let navVC = UINavigationController(rootViewController: MainTabBarViewController())
//        navVC.navigationBar.prefersLargeTitles = true
//        navVC.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
        _window.rootViewController = navVC
        _window.makeKeyAndVisible()
        self.window = _window
        
        return true
    }

}

