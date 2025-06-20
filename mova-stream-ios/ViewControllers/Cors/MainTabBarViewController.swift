//
//  MainViewController.swift
//  MovaStream
//
//  Created by HauNguyen on 26/04/2566 BE.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    private(set) var blurView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .systemMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.isUserInteractionEnabled = false // ✅ tránh ảnh hưởng layout
        return blurView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.setupView()
        self.configureTabBarAppearance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // ✅ Đặt lại kích thước blur đúng bounds
        self.blurView.frame = self.tabBar.bounds
        
        // ✅ Bo góc + shadow ổn định
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.layer.masksToBounds = true
        
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowOpacity = 0.1
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        self.tabBar.layer.shadowRadius = 8
    }
    
    private func setupView() {
        let homeVC = self.createNavigation(viewController: HomeViewController(), unSelected: "ic_home_outline", selected: "ic_home_fill", title: "Home", tag: 0)
        let exploreVC = self.createNavigation(viewController: ExploreViewController(), unSelected: "ic_explore_outline", selected: "ic_explore_fill", title: "Explore", tag: 1)
        let myListVC = self.createNavigation(viewController: MyListViewController(), unSelected: "ic_bookmarks_outline", selected: "ic_bookmarks_fill", title: "My list", tag: 2)
        let profileVC = self.createNavigation(viewController: ProfileViewController(), unSelected: "ic_user_outline", selected: "ic_user_fill", title: "User", tag: 3)
        
        self.setViewControllers([homeVC, exploreVC, myListVC, profileVC], animated: true)
        self.selectedIndex = 0
        self.selectedViewController = homeVC
        self.tabBar.tintColor = .mainColor
        self.tabBar.barTintColor = .secondaryColor
    }
    
    private func createNavigation(viewController: UIViewController, unSelected: String, selected: String, title: String, tag: Int) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: unSelected)?.resized(to: CGSize(width: 24, height: 24))
        nav.tabBarItem.selectedImage = UIImage(named: selected)?.resized(to: CGSize(width: 24, height: 24))
        nav.tabBarItem.tag = tag
        return nav
    }
    
    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = nil // ✅ Tránh conflict với blurView
        appearance.backgroundColor = .clear
        
        self.tabBar.clipsToBounds = true // ✅ đảm bảo không tràn layout
        self.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = appearance
        }
        self.tabBar.insertSubview(blurView, at: 0)
        self.tabBar.items?.forEach {
            $0.imageInsets = UIEdgeInsets(top: -1, left: 0, bottom: 1, right: 0)
            $0.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 1)
        }
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Optional animation
    }
}
