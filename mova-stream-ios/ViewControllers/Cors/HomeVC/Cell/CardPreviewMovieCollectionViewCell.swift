//
//  CardPreviewMovieCollectionViewCell.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 20/6/25.
//

import UIKit

class CardPreviewMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with image: UIImage?, point: String) {
        imageView.image = image
        pointLabel.text = point
    }

}
