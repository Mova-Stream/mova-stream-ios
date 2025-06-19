//
//  ScrollViewWithStretchyHeaderView.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 19/6/25.
//

import UIKit

class ScrollViewWithStretchyHeaderView: BaseViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    
    var label: UILabel!
    
    var headerContainerView: UIView!
    
    var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make sure the top constraint of the TableView/CollectionView/ScrollView is equal to Superview and not Safe Area
        
        // Make the Navigation Bar background transparent
        self.setNavigationBarTransparent()
        
        // Remove 'Back' text and Title from Navigation Bar
        self.setNavigationBackTextAndTitleHidden()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViews()
        
        setViewConstraints()
        
        // ScrollView
        scrollView.backgroundColor = UIColor.black
        
        // Label Customization
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis auctor risus sapien, eu mattis eros cursus a. Ut auctor ipsum ut placerat vehicula. Nulla sed risus nec neque placerat imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eleifend ante vel purus condimentum, sit amet congue nibh rutrum. Donec tristique sollicitudin nulla, quis consectetur purus bibendum ut. Nam finibus eleifend erat in eleifend. Nam nunc nibh, molestie vel dui sit amet, viverra consequat felis. Curabitur hendrerit rutrum convallis. Nulla facilisi. Mauris pretium et dolor vitae vestibulum. \n\nNullam facilisis nisi a sagittis consectetur. Proin tristique rutrum lobortis. Nam vitae mauris in ex convallis placerat. Pellentesque sed sodales diam. Fusce volutpat orci tristique justo fringilla, a efficitur urna fermentum. Maecenas sagittis tellus sed lorem maximus, at blandit enim vestibulum. Ut ac tempus diam, ut lobortis ipsum. Mauris sodales nibh laoreet arcu vestibulum, quis tincidunt ipsum mattis. Nunc eleifend justo a purus porta varius. \n\nNulla facilisi. Cras et cursus magna. Donec id nibh nunc. Mauris efficitur sem et turpis pellentesque, faucibus venenatis mauris pulvinar. Sed sed porta ligula, eu commodo elit. Nam congue tempor odio, a porta nisi dignissim sit amet. Vestibulum sed egestas mauris. Aenean vitae nisi quis mauris hendrerit blandit. Fusce ante sem, auctor et posuere at, porttitor vel dolor. \n\nNulla elementum posuere rhoncus. In vestibulum sit amet neque at malesuada. Duis suscipit vehicula enim at pretium. Phasellus non venenatis tellus. Vivamus ut arcu dignissim, vehicula lorem et, pharetra risus. Donec ut interdum ante. Fusce feugiat eget ante nec commodo. Nulla at purus rutrum, commodo metus quis, aliquet eros. Suspendisse consequat sem at nibh vulputate, non elementum purus molestie. Vivamus sit amet euismod dolor, ac ornare mi. Pellentesque semper tincidunt dolor vitae laoreet. Duis dapibus odio nec nunc facilisis ullamcorper. Nulla facilisi. Duis nec velit sollicitudin, mollis lectus et, lobortis est. Morbi ac aliquam risus. \n\nNunc ac nisi aliquam, porta arcu vel, porttitor dui. Aliquam lectus dui, pellentesque vitae commodo a, suscipit id velit. Nunc sed libero sit amet magna aliquam congue et quis neque. Praesent suscipit aliquam enim, in vulputate mi commodo efficitur. Nunc semper aliquam viverra. Aliquam erat volutpat. Mauris magna leo, egestas eget ex et, facilisis ornare lectus."
        
        // Set Image on the Header
        imageView.image = UIImage(named: "doctor_strange2")
    }
    
    func createViews() {
        // ScrollView
        scrollView = UIScrollView()
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        // Label
        label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines = 0
        self.scrollView.addSubview(label)
        
        // Header Container
        headerContainerView = UIView()
        headerContainerView.backgroundColor = .gray
        self.scrollView.addSubview(headerContainerView)
        
        // ImageView for background
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleAspectFill
        self.headerContainerView.addSubview(imageView)
    }
    
    func setViewConstraints() {
        // ScrollView Constraints
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // Label Constraints
        self.label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.label.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -10),
            self.label.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 280)
        ])
        
        // Header Container Constraints
        let headerContainerViewBottom : NSLayoutConstraint!
        
        self.headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headerContainerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        headerContainerViewBottom = self.headerContainerView.bottomAnchor.constraint(equalTo: self.label.topAnchor, constant: -10)
        headerContainerViewBottom.priority = UILayoutPriority(rawValue: 900)
        headerContainerViewBottom.isActive = true
        
        // ImageView Constraints
        let imageViewTopConstraint: NSLayoutConstraint!
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.headerContainerView.bottomAnchor)
        ])
        
        imageViewTopConstraint = self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor)
        imageViewTopConstraint.priority = UILayoutPriority(rawValue: 900)
        imageViewTopConstraint.isActive = true
    }

}
