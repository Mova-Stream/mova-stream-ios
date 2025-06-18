//
//  ThumbMovieCollectionViewCell.swift
//  MovaStream
//
//  Created by HauNguyen on 27/04/2566 BE.
//

import UIKit

class ThumbMovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "ThumbMovieCollectionViewCell"
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Demo"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        title.frame = contentView.bounds
    }
    
    
    public func configure(with model: String) {
        
        guard let _ = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }
        
        title.text = model
    }
}

