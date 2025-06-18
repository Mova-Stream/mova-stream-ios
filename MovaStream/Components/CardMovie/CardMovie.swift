//
//  CardMovie.swift
//  MovaStream
//
//  Created by HauNguyen on 06/05/2566 BE.
//

import UIKit
import NukeUI

class CardMovie: UIView {

    enum CardStyle {
        case overview
        case preview
        case cardPlay
    }
    
    static let identifier = "CardMovie"
    
    static var shared: CardMovie {
        return CardMovie()
    }
    // MARK: - Initilize UI variable
        
    fileprivate static let posterImageView: LazyImageView = {
        let imageView = LazyImageView()
        imageView.placeholderView = UIActivityIndicatorView()
        imageView.priority = .high
        imageView.pipeline = .shared
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    fileprivate static let nameMovie: MasterLabel = {
        let label = MasterLabel()
        label.font = .medium(size: 18)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate static let nameDuration: MasterLabel = {
        let label = MasterLabel()
        label.text = "1h 42m 33s"
        label.font = .medium(size: 14)
        label.textColor = .white
        return label
    }()
    
    fileprivate static let pointAverage: MasterLabel = {
        let label = MasterLabel()
        label.font = .medium(size: 10)
        label.textColor = .primaryRed
        label.clipsToBounds = true
        label.layer.backgroundColor = UIColor.primaryRed(alpha: 0.15).cgColor
        label.layer.cornerRadius = 4
        label.setEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return label
    }()
    
    fileprivate static let trashIcon: MButton = {
        let button = MButton(configuration: .plain())
        button.setImage(UIImage(named: "trash"), color: .primaryRed, size: 20, for: .normal)
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}

extension CardMovie {
    
    fileprivate static func cardPlayConfiguration() {
        
    }
    
    static func overviewConfiguration() {
        
    }
    
    static func previewConfiguration(superview view: UIView) {
        view.insertSubview(posterImageView, at: 0)
        view.insertSubview(pointAverage, at: 1)
        posterImageView.fillSuperview(superview: view)
        pointAverage.anchor(top: view.topAnchor, leading: view.leadingAnchor, constant: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0))
    }
    
}

extension CardMovie {
    
    class TableViewCell: UITableViewCell {
        
        var cardStyle: CardStyle? {
            didSet {
                if cardStyle != nil {
                    switch cardStyle! {
                    case .cardPlay:
                        cardPlayConfiguration()
                    case .overview:
                        overviewConfiguration()
                    default:
                        previewConfiguration(superview: contentView)
                    }
                }
            }
        }
        
        func setData(model movie: Movie) {
            
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
    
}

extension CardMovie {
    
    class ColllectionViewCell: UICollectionViewCell {
        
        var cardStyle: CardStyle? {
            didSet {
                if cardStyle != nil {
                    switch cardStyle! {
                    case .cardPlay:
                        cardPlayConfiguration()
                    case .overview:
                        overviewConfiguration()
                    default:
                        previewConfiguration(superview: contentView)
                    }
                }
            }
        }
        
        func setData(model movie: Movie) {
            
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
    
}
