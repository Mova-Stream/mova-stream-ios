//
//  CardMovieTableViewCell.swift
//  MovaStream
//
//  Created by HauNguyen on 04/05/2566 BE.
//

import UIKit
import NukeUI

class CardMovieTableViewCell: UITableViewCell {

    static let identifier = "CardMovieTableViewCell"
    
    private var movie: Movie?
    
    private let containerView = UIView()
    
    private let posterImageView: LazyImageView = {
        let imageView = LazyImageView()
        imageView.placeholderView = UIActivityIndicatorView()
        imageView.priority = .high
        imageView.pipeline = .shared
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private let nameMovie: MasterLabel = {
        let label = MasterLabel()
        label.font = .medium(size: 18)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private let nameDuration: MasterLabel = {
        let label = MasterLabel()
        label.text = "1h 42m 33s"
        label.font = .medium(size: 14)
        label.textColor = .white
        return label
    }()
    
    private let pointAverage: MasterLabel = {
        let label = MasterLabel()
        label.font = .medium(size: 10)
        label.textColor = .primaryRed
        label.clipsToBounds = true
        label.layer.backgroundColor = UIColor.primaryRed(alpha: 0.15).cgColor
        label.layer.cornerRadius = 4
        label.setEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return label
    }()
    
    private let trashIcon: MButton = {
        let button = MButton(configuration: .plain())
        button.setImage(UIImage(named: "trash"), color: .primaryRed, size: 20, for: .normal)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(containerView)
        self.containerView.backgroundColor = .greyDark
        self.containerView.insertSubview(posterImageView, at: 0)
        self.containerView.insertSubview(pointAverage, at: 1)
        self.containerView.insertSubview(trashIcon, at: 2)
        self.containerView.insertSubview(nameMovie, at: 3)
        self.containerView.insertSubview(nameDuration, at: 4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.fillSuperview(superview: self.contentView)
        posterImageView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, constant: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10))
        posterImageView.dimension(width: 160, height: 140)
        pointAverage.anchor(leading: posterImageView.trailingAnchor, bottom: containerView.bottomAnchor, constant: UIEdgeInsets(top: 0, left: 10, bottom: -10, right: 0))
        trashIcon.anchor(bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, constant: UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0))
        nameMovie.anchor(top: containerView.topAnchor, leading: posterImageView.trailingAnchor, trailing: containerView.trailingAnchor, constant: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))
        nameDuration.anchor(top: nameMovie.bottomAnchor, leading: posterImageView.trailingAnchor, bottom: pointAverage.topAnchor, trailing: containerView.trailingAnchor, constant: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        

    }
    
    public func updateCellWith(with movie: Movie) {
        self.movie = movie
        self.nameMovie.text = movie.title
        guard let path = movie.poster_path else {
            return
        }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(path)") else {
            return
        }
        posterImageView.url = url
        pointAverage.text = "900 MB"
    }
}

import SwiftUI

struct DemoDownload_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: DownloadViewController())
    }
}
