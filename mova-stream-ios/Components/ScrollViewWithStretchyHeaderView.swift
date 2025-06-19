//
//  ScrollViewWithStretchyHeaderView.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 19/6/25.
//

import UIKit

public class ScrollViewWithStretchyHeaderView: UIView, UIScrollViewDelegate {

    public private(set) var scrollView: UIScrollView!
    public private(set) var headerContainerView: UIView!
    public private(set) var imageView: UIImageView!
    public private(set) var contentView: UIView!
    
//    public override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.setNavigationBarTransparent()
//        self.setNavigationBackTextAndTitleHidden()
//    }

//    public override func viewDidLoad() {
//        super.viewDidLoad()
//        createViews()
//        setViewConstraints()
//        scrollView.backgroundColor = .clear
//        contentView.backgroundColor = .clear
//        imageView.image = UIImage(named: "no_image")
//    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createViews()
        setViewConstraints()
    }

    public func createViews() {
        scrollView = UIScrollView()
        scrollView.delegate = self
        self.addSubview(scrollView)

        contentView = makeStretchyHeaderContentView()
        scrollView.addSubview(contentView)

        headerContainerView = UIView()
        headerContainerView.backgroundColor = .gray
        scrollView.addSubview(headerContainerView)

        imageView = makeStretchyHeaderImageView()
        headerContainerView.addSubview(imageView)
    }

    public func makeStretchyHeaderContentView() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }

    public func makeStretchyHeaderImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }

    public func setViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 280)
        ])

        headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        let headerContainerViewBottom = headerContainerView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -10)
        headerContainerViewBottom.priority = UILayoutPriority(900)
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerContainerViewBottom
        ])

        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: self.topAnchor)
        imageViewTopConstraint.priority = UILayoutPriority(900)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor),
            imageViewTopConstraint
        ])
    }
}
