//
//  MasterView.swift
//  Mova
//
//  Created by HauNguyen on 09/12/2565 BE.
//

import UIKit

class MasterView: UIView {

    convenience init() {
        self.init(frame: .zero)
        self.setupViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayoutSubviews()
    }
    
    func setupViews() {
        
    }
    
    func setupLayoutSubviews() {
        
    }

}
