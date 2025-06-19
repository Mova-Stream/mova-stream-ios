//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit
import SwiftUI
import ComponentsKit
import AutoLayout

class HomeViewController: BaseViewController {
    // MARK: - ViewModel
    // Define any ViewModel properties if needed
    
    // MARK: - Properties
    
    private var scrollViewStretchyHeaderView: ScrollViewWithStretchyHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupScrollViewStretchyHeader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarBackgroundColor(.clear)
        
        let blur = UIBlurEffect(style: .dark)
        self.setNavigationBarBackgroundBlurWhenScroll(blur)
    }
}

// MARK: - Navigation
extension HomeViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let destination = segue.destination as? UINavigationController,
           let viewController = destination.viewControllers.first as? BaseViewController {
            viewController.hidesBottomBarWhenPushed = true
        }
    }
    
    @objc private func didTapSearchBarItem() {
        // Handle left bar item tap
        NSLog("Search bar item tapped")
    }
    
    @objc private func didTapBellBarItem() {
        // Handle right bar item tap
        NSLog("Bell bar item tapped")
    }
}


// MARK: - Setup UI
extension HomeViewController {

    private func setupUI() {
        self.setupNavigationBarItem()
    }
    
    private func setupNavigationBarItem() {
        let logoButton = UKButton(model: ButtonVM {
            $0.title = ""
            $0.imageSrc = ButtonVM.ImageSource.local("mova", bundle: nil)
            $0.imageRenderingMode = .original
            $0.color = ComponentColor(main: .clear, contrast: .clear, background: .clear)
            $0.size = .large
            $0.isEnabled = false
            $0.style = .plain
        }, action: {})
        
        let searchButton = UKButton(model: ButtonVM {
            $0.title = ""
            $0.imageSrc = ButtonVM.ImageSource.local("ic_search", bundle: nil)
            $0.imageRenderingMode = .template
            $0.color = ComponentColor(main: .white, contrast: .clear)
            $0.style = .minimal
        }, action: didTapSearchBarItem)
        
        let bellButton = UKButton(model: ButtonVM {
            $0.title = ""
            $0.imageSrc = ButtonVM.ImageSource.local("ic_bell", bundle: nil)
            $0.imageRenderingMode = .template
            $0.color = ComponentColor(main: .white, contrast: .clear)
            $0.style = .minimal
        }, action: didTapBellBarItem)
        
        let stackView = UIStackView(subViews: [searchButton, bellButton], axis: .horizontal, spacing: 24, distribution: .fillEqually)
        
        self.setLeftBarItem(view: logoButton)
        self.setRightBarItem(view: stackView)
    }
    
    private func setupScrollViewStretchyHeader() {
        scrollViewStretchyHeaderView = ScrollViewWithStretchyHeaderView()
        scrollViewStretchyHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(scrollViewStretchyHeaderView)
        NSLayoutConstraint.activate([
            scrollViewStretchyHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollViewStretchyHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewStretchyHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewStretchyHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollViewStretchyHeaderView.imageView.image = UIImage(named: "doctor_strange2")
        
        let titleLabel = UILabel()
        let descriptionLabel = UILabel()
        
        titleLabel.text = "Movie Title"
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .label
        
        descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis auctor risus sapien, eu mattis eros cursus a. Ut auctor ipsum ut placerat vehicula. Nulla sed risus nec neque placerat imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eleifend ante vel purus condimentum, sit amet congue nibh rutrum. Donec tristique sollicitudin nulla, quis consectetur purus bibendum ut. Nam finibus eleifend erat in eleifend. Nam nunc nibh, molestie vel dui sit amet, viverra consequat felis. Curabitur hendrerit rutrum convallis. Nulla facilisi. Mauris pretium et dolor vitae vestibulum. \n\nNullam facilisis nisi a sagittis consectetur. Proin tristique rutrum lobortis. Nam vitae mauris in ex convallis placerat. Pellentesque sed sodales diam. Fusce volutpat orci tristique justo fringilla, a efficitur urna fermentum. Maecenas sagittis tellus sed lorem maximus, at blandit enim vestibulum. Ut ac tempus diam, ut lobortis ipsum. Mauris sodales nibh laoreet arcu vestibulum, quis tincidunt ipsum mattis. Nunc eleifend justo a purus porta varius. Nulla facilisi. Cras et cursus magna. \n\nDonec id nibh nunc. Mauris efficitur sem et turpis pellentesque, faucibus venenatis mauris pulvinar. Sed sed porta ligula, eu commodo elit. Nam congue tempor odio, a porta nisi dignissim sit amet. Vestibulum sed egestas mauris. Aenean vitae nisi quis mauris hendrerit blandit. Fusce ante sem, auctor et posuere at, porttitor vel dolor. \n\nNulla elementum posuere rhoncus. In vestibulum sit amet neque at malesuada. Duis suscipit vehicula enim at pretium. Phasellus non venenatis tellus. Vivamus ut arcu dignissim, vehicula lorem et, pharetra risus. Donec ut interdum ante. Fusce feugiat eget ante nec commodo. Nulla at purus rutrum, commodo metus quis, aliquet eros. Suspendisse consequat sem at nibh vulputate, non elementum purus molestie. Vivamus sit amet euismod dolor, ac ornare mi. Pellentesque semper tincidunt dolor vitae laoreet. Duis dapibus odio nec nunc facilisis ullamcorper. Nulla facilisi. Duis nec velit sollicitudin, mollis lectus et, lobortis est. \n\nMorbi ac aliquam risus. Nunc ac nisi aliquam, porta arcu vel, porttitor dui. Aliquam lectus dui, pellentesque vitae commodo a, suscipit id velit. Nunc sed libero sit amet magna aliquam congue et quis neque. Praesent suscipit aliquam enim, in vulputate mi commodo efficitur. Nunc semper aliquam viverra. Aliquam erat volutpat. Mauris magna leo, egestas eget ex et, facilisis ornare lectus."
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.numberOfLines = 0
        
        scrollViewStretchyHeaderView.contentView.addSubview(titleLabel)
        scrollViewStretchyHeaderView.contentView.addSubview(descriptionLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollViewStretchyHeaderView.contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: scrollViewStretchyHeaderView.contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: scrollViewStretchyHeaderView.contentView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollViewStretchyHeaderView.contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollViewStretchyHeaderView.contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: scrollViewStretchyHeaderView.contentView.bottomAnchor)
        ])
    }
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        return PreviewUIViewController(viewController: HomeViewController())
    }
}
