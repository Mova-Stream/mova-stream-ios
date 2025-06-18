//
//  CardMovieImageCollectionViewCell.swift
//  MovaStream
//
//  Created by HauNguyen on 04/05/2566 BE.
//

import UIKit
import NukeUI

class CardMovieImageonly: UICollectionViewCell {
    
    static let identifier = "CardMovieImageCollectionViewCell"
    
    private var movie: Movie?
    
    private let posterImageView: LazyImageView = {
        let imageView = LazyImageView()
        imageView.placeholderView = UIActivityIndicatorView()
        imageView.priority = .high
        imageView.pipeline = .shared
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private let pointAverage: MasterLabel = {
        let label = MasterLabel()
        label.font = .regular(size: 10)
        label.textColor = .white
        label.clipsToBounds = true
        label.layer.backgroundColor = UIColor.primaryRed.cgColor
        label.layer.cornerRadius = 4
        label.setEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.insertSubview(posterImageView, at: 0)
        contentView.insertSubview(pointAverage, at: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.fillSuperview(superview: self)
        pointAverage.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, constant: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setData(model movie: Movie) {
        self.movie = movie
        
        guard let path = movie.poster_path else {
            return
        }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(path)") else {
            return
        }
        posterImageView.url = url
        pointAverage.text = movie.vote_average.description
    }
}
