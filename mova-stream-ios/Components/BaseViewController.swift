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
    
    // MARK: - Lifecycle
    
    /// 1
    /// Khi view controller đã được nạp vào bộ nhớ( điều kiện là cái view controller này chưa tồn tại trong bộ nhớ), thì hàm viewDidLoad được gọi.
    /// Chỉ được gọi một lần duy nhất trong chu kỳ sống của view đó thôi.
    /// Thường dùng để chuẩn bị data hoặc là khởi tạo các giá trị mặc định cho các object cũng như UI trên màn hình.
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// 2
    /// Hàm sẽ được gọi trước khi một view được thêm vào hệ thống view và trước animation hiển thị một view.
    /// Tại thời điểm animation để hiển thị view thì nếu bạn muốn tuỳ chỉnh gì thì hàm này sẽ giúp bạn làm điều đó.
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make sure the top constraint of the TableView is equal to Superview and not Safe Area
        // Hide the navigation bar completely
        // Make the Navigation Bar background transparent
    }
    
    /// 3
    /// Hàm sẽ được gọi khi một view đã được thêm vài hệ thống view và đã hiển thị lên màn hình.
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /// 4
    /// Gọi khi một view đã được ẩn khỏi màn hình và amination khi ẩn view đó.
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    /// 5
    /// Gọi khi một view đã được ẩn khỏi màn hình.
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    /// 6
    /// viewDidLayoutSubviews() là thời điểm an toàn và chính xác nhất để truy cập frame, bounds, và layout thực tế của các view – vì nó được gọi sau khi Auto Layout đã áp dụng.
    /// Tạo rounded corners sau khi view có kích thước thật
    /// Tính toán layout theo frame
    /// Scroll đến vị trí mặc định sau khi view render
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}


extension BaseViewController {
    
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

// MARK: - Status Bar Control
extension BaseViewController {

    /// Override this method to control the status bar appearance
    /// - Returns: The preferred status bar style for this view controller
    /// - Note: This method is called when the view controller's view is about to appear.
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let destination = segue.destination as? UINavigationController,
           let viewController = destination.viewControllers.first as? BaseViewController {
            viewController.hidesBottomBarWhenPushed = true
        }
    }
    
}


// MARK: - Navigation Bar Control
extension BaseViewController {
    
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
    func setNavigationBarBackgroundTransparent() {
        // Make the Navigation Bar background transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.commonConfigNavigationBar()
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
        self.commonConfigNavigationBar()
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
        self.commonConfigNavigationBar()
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
        self.commonConfigNavigationBar()
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
        self.commonConfigNavigationBar()
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
        self.commonConfigNavigationBar()
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
        self.commonConfigNavigationBar()
    }
    
    // Sets the navigation title with a custom color
    public func setNavigationTitle(_ title: String, color: UIColor? = nil) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = color ?? .white
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
        self.commonConfigNavigationBar()
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
        self.commonConfigNavigationBar()
    }
    
    public func setLeftBarItem(view: UIView) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
        self.commonConfigNavigationBar()
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
        self.commonConfigNavigationBar()
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
        self.commonConfigNavigationBar()
    }
    
    public func setRightBarItem(_ view: UIView) {
        self.commonConfigNavigationBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view)
    }
    
    public func setRightBarItems(_ views: [UIView]) {
        self.commonConfigNavigationBar()
        navigationItem.rightBarButtonItems = views.map { UIBarButtonItem(customView: $0) }
    }
    
    public func hideNavigationBar(animated: Bool = true) {
        self.commonConfigNavigationBar()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    public func showNavigationBar(animated: Bool = true) {
        self.commonConfigNavigationBar()
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func commonConfigNavigationBar() {
        navigationController?.navigationBar.tintColor = .label
    }
    
    func setNavigationBarStyle(_ style: UIBarStyle) {
        navigationController?.navigationBar.barStyle = style
    }
    
    func setNavigationBarDisplayMode(_ mode: UINavigationItem.LargeTitleDisplayMode) {
        navigationController?.navigationItem.largeTitleDisplayMode = mode
    }
    
    func setNavigationLargeTitle(_ value: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = value
    }
    
    
}

