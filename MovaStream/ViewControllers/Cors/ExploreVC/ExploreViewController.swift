//
//  SearchViewController.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit

class ExploreViewController: UIScrollTabBarPage {
        
    private let listScroll: [String] = [
        "Button 01", "Button 02", "Button 03", "Button 04"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollTabBarDelegate = self
        self.scrollTabBarDataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // Reload data or call api..
    @objc private func reloadData() {
        print("Data loading...")
    }
}

extension ExploreViewController: UIScrollTabBarPageDelegate, UIScrollTabBarPageDataSource {
    
    func pagesOfScrollTabBarViewController(in scrollTabBar: UIScrollTabBarPage) -> [UIViewController]? {
        return [AllCategoryViewController(), MoviesViewController(), TVSeriesViewController(), CinemasViewController()]
    }
    
    func numberOfRowsScrollTabBar(in scrollTabBar: UIScrollTabBarPage) -> Int {
        return self.listScroll.count
    }
    
    func scrollTabBar(scrollTabBar: UIScrollTabBarPage, pageForRowAt index: Int) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .grey
        return viewController
    }
    
    func scrollTabBar(scrollTabBar: UIScrollTabBarPage, viewForCellUnSelectedAt index: Int) -> UIView
    {
        let button = MButton()
        button.setTitle("index", for: .normal)
        return button
    }
    
    func scrollTabBar(scrollTabBar: UIScrollTabBarPage, viewForCellSelectedAt index: Int) -> UIView {
        let button = MButton()
        button.setTitle("selected index", for: .normal)
        return button
    }
    
    func scrollTabBar(scrollTabBar: UIScrollTabBarPage, didScrollTabBarSelectedCell index: Int) {
        
    }
}

import SwiftUI

struct ExploreViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: ExploreViewController())
    }
}
