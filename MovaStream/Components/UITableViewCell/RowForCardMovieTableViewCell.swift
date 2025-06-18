//
//  RowTableViewCell.swift
//  MovaStream
//
//  Created by HauNguyen on 27/04/2566 BE.
//

import UIKit

protocol RowMovieCellModelDelegate: AnyObject {
    func rowMovieDidTapCell(_ cell: RowForCardMovieTableViewCell, model movie: Movie)
}

struct RowMovieCellModel: Codable {
    init() {
        self.rowName = ""
        self.movies = [Movie]()
    }
    init(rowName: String, movies: [Movie]) {
        self.rowName = rowName
        self.movies = movies
    }
    let rowName: String
    let movies: [Movie]
}

class RowForCardMovieTableViewCell: UITableViewCell {
    
    static let identifier = "RowForCardMovieTableViewCell"
    
    weak var delegate: RowMovieCellModelDelegate?
    
    private var movies = [Movie]()
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 140, height: 200)
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(CardMovie.ColllectionViewCell.self, forCellWithReuseIdentifier: CardMovie.identifier)
        collectionView.backgroundColor = .greyDark
        return collectionView
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
        contentView.insertSubview(collectionView, at: 0)
        contentView.backgroundColor = .greyDark
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.fillSuperview(superview: contentView)
    }
    
    private func downloadTitleAt(indexPath: IndexPath) {
        print("Item index at: " + indexPath.description)
    }
    
    public func setDataRow(model section: RowMovieCellModel) {
        self.movies = section.movies
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}


extension RowForCardMovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMovie.identifier, for: indexPath) as? CardMovie.ColllectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cardStyle = .preview
        cell.setData(model: movies[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        self.delegate?.rowMovieDidTapCell(self, model: movies[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil) {[weak self] _ in
                let downloadAction = UIAction(title: "Download", subtitle: nil, image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                    self?.downloadTitleAt(indexPath: indexPath)
                }
                return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [downloadAction])
            }
        
        return config
    }
}


import SwiftUI

struct RowTableViewCellDelegate_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: HomeViewController())
    }
}
