//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit
import SwiftUI

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
}

// MARK: - Setup UI
extension HomeViewController {

    private func setupUI() {
        self.setupNavigationBarItem()
    }
    
    private func setupNavigationBarItem() {
        guard let logoImage = UIImage(named: "mova"),
        let resizedImage = logoImage.resized(to: CGSize(width: 24, height: 24))?.withRenderingMode(.alwaysOriginal) else { return }
        self.setLeftBarItem(icon: resizedImage)
        
        guard let searchImage = UIImage(named: "ic_search"),
        let resizedSearchImage = searchImage.resized(to: CGSize(width: 24, height: 24))?.withRenderingMode(.alwaysOriginal) else { return }
        let searchButton = UIButton(type: .system)
        searchButton.setImage(resizedSearchImage, for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        guard let bellImage = UIImage(named: "ic_bell_outline"),
        let resizedBellImage = bellImage.resized(to: CGSize(width: 24, height: 24))?.withRenderingMode(.alwaysOriginal) else { return }
        let bellButton = UIButton(type: .system)
        bellButton.setImage(resizedBellImage, for: .normal)
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 24))
        rightView.addSubview(searchButton)
        rightView.addSubview(bellButton)
        
        searchButton.anchor(leading: rightView.leadingAnchor)
        searchButton.centerY(superview: rightView)
        
        bellButton.anchor(trailing: rightView.trailingAnchor)
        bellButton.centerY(superview: rightView)
        
        self.setRightBarItem(view: rightView)
    }
    
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        return PreviewUIViewController(viewController: HomeViewController())
    }
}
