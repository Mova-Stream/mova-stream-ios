//
//  HomeViewHeader.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import UIKit

class HomeViewHeader: MasterView {
    
    private var containerView = UIView()

    public var stretchyHeader: StretchyTableHeaderView = {
        let header = StretchyTableHeaderView()
        header.imageView.image = UIImage(named: "doctor_strange2")
        return header
    }()
    
    private let buttonPlay: MButton = {
        var button = MButton(configuration: .filled())
        button.setImage(UIImage(named: "play-solid"), imagePlace: .leading, color: .white, size: 20, imagePadding: 8, for: .normal)
        button.setTitle("Play", textColor: .white, for: .normal)
        button.setTitle("Play", textColor: .white, for: .highlighted)
        button.setBackground(.primaryRed, cornerRadius: 30, for: .normal)
        return button
    }()
    
    private let buttonList: MButton = {
        var button = MButton(configuration: .borderless())
        button.setImage(UIImage(named: "plus"), imagePlace: .leading, color: .white, size: 20, imagePadding: 8, for: .normal)
        button.setTitle("Add to list", textColor: .white, for: .normal)
        button.setTitle("Add to list", textColor: .white, for: .highlighted)
        button.setBackground(strokeColor: .white, cornerRadius: 30, for: .normal)
        return button
    }()
    
    private let largeTitle: UILabel = {
        let title = UILabel()
        title.text = "Dr.Strange 2"
        title.font = .boldSystemFont(ofSize: 26)
        title.textColor = .textColor
        return title
    }()
    
    private let subTitle: UILabel = {
        let title = UILabel()
        title.text = "Action, Superhero, Science Fiction."
        title.font = .medium(size: 16)
        title.textColor = .white
        return title
    }()
    
    override func setupViews() {
        super.setupViews()
        self.insertSubview(self.stretchyHeader, at: 0)
        self.insertSubview(self.containerView, at: 1)
        self.bringSubviewToFront(self.containerView)
        
        let views = [self.largeTitle, self.subTitle, self.buttonPlay, self.buttonList] as [UIView]
        views.forEach { view in
            self.containerView.insertSubview(view, at: views.firstIndex(of: view)!)
        }
    }
    
    override func setupLayoutSubviews() {
        super.setupLayoutSubviews()
        self.stretchyHeader.fillSuperview(superview: self)
                
        self.containerView.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            constant: UIEdgeInsets(top: 0, left: 20, bottom: -20, right: 0)
        )
        
        self.largeTitle.anchor(
            top: nil,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: nil
        )
        
        self.subTitle.anchor(
            top: self.largeTitle.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            constant: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        )
        
        self.buttonPlay.anchor(
            top: self.subTitle.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: self.containerView.bottomAnchor,
            constant: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        )
        
        self.buttonList.anchor(
            leading: self.buttonPlay.trailingAnchor,
            bottom: self.containerView.bottomAnchor,
            constant: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
        )
    }

}
