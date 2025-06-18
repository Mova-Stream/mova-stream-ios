//
//  HomeViewHeader.swift
//  MovaStream
//
//  Created by HauNguyen on 26/04/2566 BE.
//

import UIKit

class NavigationBarHeader: MasterView {
    
    public var showSearchBar: Bool? {
        didSet {
            if showSearchBar! {
                self.rightStackView.insertArrangedSubview(searchButtonIcon, at: 0)
            }
        }
    }
    
    public var showNotificationBar: Bool? {
        didSet {
            if showNotificationBar! {
                self.rightStackView.insertArrangedSubview(ringButtonIcon, at: 1)
            }
        }
    }
    
    private var containerView = UIView()
    
    public var rightStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    private let logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mova")?.resized(to: CGSize(width: 32, height: 32))
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(size: 20)
        label.textColor = .white
        return label
    }()
    
    private let searchButtonIcon: MButton = {
        var button = MButton(configuration: .plain())
        button.setImage(UIImage(named: "search"), color: .white, size: 20, for: .normal)
        return button
    }()
    
    private let ringButtonIcon: MButton = {
        var button = MButton(configuration: .plain())
        button.setImage(UIImage(named: "bell"), color: .white, size: 20, for: .normal)
        return button
    }()

    override func setupViews() {
        super.setupViews()
        containerView.insertSubview(logoView, at: 0)
        containerView.insertSubview(titleLabel, at: 1)
        containerView.insertSubview(rightStackView, at: 2)
        addSubview(containerView)
        backgroundColor = .greyDark
    }

    override func setupLayoutSubviews() {
        super.setupLayoutSubviews()
        logoView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor)
        titleLabel.anchor(top: containerView.topAnchor, leading: logoView.trailingAnchor, bottom: containerView.bottomAnchor, constant: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        rightStackView.anchor(top: containerView.topAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor)
        containerView.fillSuperview(superview: self, constant: UIEdgeInsets(top: UIScreen.edges.top + 10, left: 20, bottom: -10, right: -20))
        
    }
}
