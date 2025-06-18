//
//  TabLayoutScrollView.swift
//  IOSTablayoutWithViewPager
//
//  Created by Sanjeev .Gautam on 03/07/17.
//  Copyright © 2017 SWS. All rights reserved.
//

import UIKit

//MARK:- Delegate
@objc protocol UIScrollTabBarPageDelegate {
    @objc optional func scrollTabBar(scrollTabBar: UIScrollTabBarPage, didScrollTabBarSelectedCell index: Int) -> Void
}

//MARK:- Data Source
protocol UIScrollTabBarPageDataSource {
    // Pages of UIPageViewController
    func pagesOfScrollTabBarViewController(in scrollTabBar: UIScrollTabBarPage) -> [UIViewController]?
    
    // Number of rows scroll tab bar
    func numberOfRowsScrollTabBar(in scrollTabBar: UIScrollTabBarPage) -> Int

    // View for un selected at index
    func scrollTabBar(scrollTabBar: UIScrollTabBarPage, viewForCellUnSelectedAt index: Int) -> UIView
    
    // View for selected at index
    func scrollTabBar(scrollTabBar: UIScrollTabBarPage, viewForCellSelectedAt index: Int) -> UIView
}

//MARK:- UIScrollTabBar
class UIScrollTabBarPage: UIPageViewController {
    
    var scrollTabBarDelegate: UIScrollTabBarPageDelegate?

    var scrollTabBarDataSource: UIScrollTabBarPageDataSource?
    
    fileprivate var pages: [UIViewController] {
        get {
            self.scrollTabBarDataSource?.pagesOfScrollTabBarViewController(in: self) ?? []
        }
    }
    
    fileprivate var numberOfRows: Int {
        get {
            self.scrollTabBarDataSource?.numberOfRowsScrollTabBar(in: self) ?? 0
        }
    }
    
    fileprivate func viewForCellUnSelectedAt(index: Int) -> UIView {
        return self.scrollTabBarDataSource?.scrollTabBar(scrollTabBar: self, viewForCellUnSelectedAt: index) ?? UIView()
    }
    
    fileprivate func viewForCellSelectedAt(index: Int) -> UIView {
        return self.scrollTabBarDataSource?.scrollTabBar(scrollTabBar: self, viewForCellSelectedAt: index) ?? UIView()
    }
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.indicatorStyle = .default
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.backgroundColor = .greyDark
        return scroll
    }()
    
    private let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let _scrollTabBarDataSource = self.scrollTabBarDataSource else { return }

        // Setup uiscrollview ..
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(hStack)
        self.scrollView.contentSize = hStack.frame.size
        // Setup uistackview ..
        self.scrollView.anchor(top: self.scrollView.topAnchor, leading: self.scrollView.leadingAnchor, trailing: self.scrollView.trailingAnchor)
        self.scrollView.dimension(height: 44)
        self.hStack.fillSuperview(superview: self.scrollView)
        
        for number in 0...((_scrollTabBarDataSource.numberOfRowsScrollTabBar(in: self)) - 1) {
            self.hStack.addArrangedSubview((_scrollTabBarDataSource.scrollTabBar(scrollTabBar: self, viewForCellUnSelectedAt: number)))
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let _scrollTabBarDataSource = self.scrollTabBarDataSource else { return }
        if let firstVC = self.pages.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true)
        }
        
//        self.scrollView.anchor(top: view.topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
//        self.scrollView.dimension(height: 44)
    }
}

extension UIScrollTabBarPage: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else { return pages.last }

        guard pages.count > previousIndex else { return nil        }

        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1

        guard nextIndex < pages.count else { return pages.first }

        guard pages.count > nextIndex else { return nil         }

        return pages[nextIndex]
    }
}

import SwiftUI

struct Exprlore2_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: ExploreViewController())
    }
}
