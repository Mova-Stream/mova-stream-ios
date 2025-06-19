//
//  BaseViewController.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 18/6/25.
//

import UIKit

public class BaseViewController: UIViewController {
    // MARK: - Properties
    
    private var leftAction: (() -> Void)?
    private var rightAction: (() -> Void)?
//    
//    // MARK: - Lifecycle
//    
//    /// 0
//    /// Called first when initializing a view controller
//    /// Eg: initialize the UI
//    public override func loadView() {
//        super.loadView()
//    }
//    
//    /// 1
//    /// When the view controller has been loaded into memory (provided that this view controller does not already exist in memory), the viewDidLoad function is called.
//    /// Called only once in the life of that view.
//    /// Often used to prepare data or initialize default values for objects and UI on the screen.
//    public override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    /// 2
//    /// Called before a view is added to the view system and before the animation renders a view.
//    /// At the time of animation to display the view, if you want to customize something, this function will help you do it.
//    public override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        // Make sure the top constraint of the TableView is equal to Superview and not Safe Area
//        // Hide the navigation bar completely
//        // Make the Navigation Bar background transparent
//    }
//    
//    /// 3
//    /// The function will be called when a view has been added to several view systems and displayed on the screen.
//    public override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//    }
//    
//    /// 4
//    /// Called when a view has been hidden from the screen and amination when the view is hidden.
//    public override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//    }
//    
//    /// 5
//    /// Called when a view has been hidden from the screen.
//    public override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//    }
//    
//    public override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//    }
}


extension BaseViewController {
    
    // MARK: - Navigation Bar Control
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
    
    public func setNavigationTitle(_ title: String, color: UIColor = .label) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = color
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        navigationItem.titleView = titleLabel
    }
    
    public func setLeftBarItem(icon: UIImage?, action: (() -> Void)? = nil) {
        let button = UIButton(type: .system)
        button.setImage(icon, for: .normal)
        button.tintColor = .label
        if let action = action {
            self.leftAction = action
            button.addTarget(self, action: #selector(didTapLeftItem), for: .touchUpInside)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    public func setLeftBarItem(title: String, action: (() -> Void)? = nil) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tintColor = .label
        if let action = action {
            self.leftAction = action
            button.addTarget(self, action: #selector(didTapLeftItem), for: .touchUpInside)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    public func setLeftBarItem(view: UIView) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
    }
    
    public func setRightBarItem(icon: UIImage?, action: (() -> Void)? = nil) {
        let button = UIButton(type: .system)
        button.setImage(icon, for: .normal)
        button.tintColor = .label
        if let action = action {
            self.rightAction = action
            button.addTarget(self, action: #selector(didTapRightItem), for: .touchUpInside)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    public func setRightBarItem(title: String, action: (() -> Void)? = nil) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tintColor = .label
        if let action = action {
            self.rightAction = action
            button.addTarget(self, action: #selector(didTapRightItem), for: .touchUpInside)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    public func setRightBarItem(view: UIView) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view)
    }
    
    public func hideNavigationBar(animated: Bool = true) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    public func showNavigationBar(animated: Bool = true) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // Sets the navigation bar to be transparent and hides the shadow
    /**
        Using example:
        ```swift
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.setNavigationBarBackgroundColor()
         }
        ```
     */
    public func setNavigationBarBackgroundColorWhenScroll(_ color: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]

        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    // Sets the navigation bar to be transparent and hides the shadow
    /**
        Using example:
        ```swift
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.setNavigationBarBackgroundImageWhenScroll()
         }
        ```
     */
    public func setNavigationBarBackgroundImageWhenScroll(_ image: UIImage) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundImage = image
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]

        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    // Sets the navigation bar to be transparent and hides the shadow
    /**
        Using example:
        ```swift
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.setNavigationBarBackgroundBlurWhenScroll()
         }
        ```
     */
    public func setNavigationBarBackgroundBlurWhenScroll(_ blurEffect: UIBlurEffect) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.backgroundEffect = blurEffect
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    // Sets the navigation bar to be transparent and hides the shadow
    /**
        Using example:
        ```swift
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.setNavigationBarBackgroundColor()
         }
        ```
     */
    public func setNavigationBarBackgroundColor(_ color: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]

        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // Sets the navigation bar to be transparent and hides the shadow
    /**
        Using example:
        ```swift
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.setNavigationBarBackgroundImage()
         }
        ```
     */
    public func setNavigationBarBackgroundImage(_ image: UIImage) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundImage = image
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]

        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
    // Sets the navigation bar to be transparent and hides the shadow
    /**
        Using example:
        ```swift
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.setNavigationBarBackgroundBlur()
         }
        ```
     */
    public func setNavigationBarBackgroundBlur(_ blueEffect: UIBlurEffect) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundEffect = blueEffect
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]

        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Convenience
    
    public func addDismissKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func didTapLeftItem() {
        self.leftAction?()
    }
    
    @objc private func didTapRightItem() {
        self.rightAction?()
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
