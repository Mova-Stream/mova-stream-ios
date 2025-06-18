//
//  BaseHeaderView.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 18/6/25.
//

import UIKit

class BaseHeaderView: UIView {
    
    private var backgroundImage: UIImage?
    private var leftView: UIView?
    private var centerView: UIView?
    private var rightView: UIView?
    private var backgroundImageView: UIImageView?
    
    init(
        leftView: UIView? = nil,
        centerView: UIView? = nil,
        rightView: UIView? = nil,
        backgroundColor: UIColor? = nil,
        backgroundImage: UIImage? = nil,
        height: CGFloat = 44
    ) {
        super.init(frame: .zero)
        
        self.setupLayout(height: height)
        
        if let leftView = leftView {
            self.setLeftView(leftView)
        }
        
        if let centerView = centerView {
            self.setCenterView(centerView)
        }
        
        if let rightView = rightView {
            self.setRightView(rightView)
        }
        
        if let backgroundColor = backgroundColor {
            self.setupBackground(backgroundColor)
        }
        
        if let backgroundImage = backgroundImage {
            self.setupBackground(backgroundImage)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLeftView(_ view: UIView) {
        leftView?.removeFromSuperview()
        leftView = view
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            view.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setCenterView(_ view: UIView) {
        centerView?.removeFromSuperview()
        centerView = view
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setRightView(_ view: UIView) {
        rightView?.removeFromSuperview()
        rightView = view
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            view.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setBackgroundView(_ view: UIView) {
        insertSubview(view, at: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupBackground(_ backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
    }
    
    func setupBackground(_ backgroundImage: UIImage) {
        if backgroundImageView == nil {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            insertSubview(imageView, at: 0)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: topAnchor),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
            backgroundImageView = imageView
        }
        backgroundImageView?.image = backgroundImage
    }
    
    private func setupLayout(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
