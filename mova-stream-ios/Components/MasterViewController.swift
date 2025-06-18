//
//  MasterViewController.swift
//  MovaStream
//
//  Created by HauNguyen on 26/04/2566 BE.
//

import UIKit

public class MasterViewController: UIViewController {
    
//    /// Navigation bar with logo, title, search and notification
//    public var navigationBarDefault: Bool? {
//        didSet {
//            if navigationBarDefault! {
//                let image = UIImage(named: "mova")?.withRenderingMode(.alwaysOriginal)
//                navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
//                navigationItem.rightBarButtonItems = [
//                    UIBarButtonItem(image: UIImage(systemName: "search"), style: .done, target: self, action: nil),
//                    UIBarButtonItem(image: UIImage(systemName: "bell"), style: .done, target: self, action: nil)
//                ]
//                navigationController?.navigationBar.tintColor = .white
//                navigationController?.navigationBar.barStyle = .default
//            }
//        }
//    }
//    
//    /// Navigation bar default title
//    public var navigationBarTitle: String? {
//        didSet {
//            if navigationBarTitle != nil {
//                navigationItem.leftBarButtonItem?.title = navigationBarTitle!
//            }
//        }
//    }
//    
//    /// Navigation bar right buttons
//    public var navigationSearch: Bool? {
//        didSet {
//            if navigationSearch != nil {
//                let item = UIBarButtonItem(image: UIImage(systemName: "search"), style: .done, target: self, action: nil)
//                let count = navigationItem.rightBarButtonItems?.count ?? 0
//                navigationItem.rightBarButtonItems?.insert(item, at: count + 1)
//            }
//        }
//    }
//    
//    /// Navigation bar right buttons
//    public var navigationNotification: Bool? {
//        didSet {
//            if navigationNotification != nil {
//                let item = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .done, target: self, action: nil)
//                let count = navigationItem.rightBarButtonItems?.count ?? 0
//                navigationItem.rightBarButtonItems?.insert(item, at: count + 1)
//            }
//        }
//    }
//    
//    /// Navigation bar back image
//    public var navigationBack: Bool? {
//        didSet {
//            if navigationBack != nil {
//                let image = UIImage(named: "arrow-back")?.withRenderingMode(.alwaysOriginal)
//                navigationItem.leftBarButtonItem?.image = image
//                navigationController?.navigationBar.tintColor = .white
//            }
//        }
//    }
//    
//    /// Navigation bar back title
//    public var navigationBackTitle: String? {
//        didSet {
//            if navigationBackTitle != nil {
//                navigationItem.leftBarButtonItem?.title = navigationBackTitle!
//            }
//        }
//    }
    
    // MARK: - Life cycle
    
    /// 0
    /// Called first when initializing a view controller
    /// Eg: initialize the UI
    public override func loadView() {
        super.loadView()
    }
    
    /// 1
    /// When the view controller has been loaded into memory (provided that this view controller does not already exist in memory), the viewDidLoad function is called.
    /// Called only once in the life of that view.
    /// Often used to prepare data or initialize default values for objects and UI on the screen.
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greyDark
    }
    
    /// 2
    /// Called before a view is added to the view system and before the animation renders a view.
    /// At the time of animation to display the view, if you want to customize something, this function will help you do it.
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make sure the top constraint of the TableView is equal to Superview and not Safe Area
        // Hide the navigation bar completely
        // Make the Navigation Bar background transparent
    }
    
    /// 3
    /// The function will be called when a view has been added to several view systems and displayed on the screen.
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /// 4
    /// Called when a view has been hidden from the screen and amination when the view is hidden.
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    /// 5
    /// Called when a view has been hidden from the screen.
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
}


extension MasterViewController {
    
    func hiddenNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
