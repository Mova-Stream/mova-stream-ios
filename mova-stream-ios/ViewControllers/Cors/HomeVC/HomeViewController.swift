//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit
import ComponentsKit
import AutoLayout

class HomeViewController: BaseViewController {
    // MARK: - ViewModel
    // Define any ViewModel properties if needed
    
    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideNavigationBar()
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
    
}
