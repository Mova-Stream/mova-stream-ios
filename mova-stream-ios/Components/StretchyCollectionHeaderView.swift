//
//  StretchyCollectionHeaderView.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 19/6/25.
//

import UIKit

class StretchyCollectionHeaderView: UICollectionReusableView {
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
        
        setViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createViews() {
        // ImageView
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
    }
    
    func setViewConstraints() {
        // ImageView Constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension UICollectionViewFlowLayout {
    open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach { attribute in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let collectionView = collectionView else { return }
                let contentOffsetY = collectionView.contentOffset.y
                
                if contentOffsetY < 0 {
                    let width = collectionView.frame.width
                    let height = attribute.frame.height - contentOffsetY
                    attribute.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
                }
            }
        }
        
        return layoutAttributes
    }
    
    open override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

// MARK: - Using
/**
 
    Adding Stretchy Header in UITableView
    ```swift
     class CollectionView: UIViewController {
         @IBOutlet var collectionView: UICollectionView!
         
         override func viewDidLoad() {
             super.viewDidLoad()
             // ...

             // Set CollectionView Flow Layout for Header and Items
             let flowLayout = UICollectionViewFlowLayout()
             flowLayout.scrollDirection = .vertical
             flowLayout.itemSize = CGSize(width: 100, height: 100)
             flowLayout.minimumLineSpacing = 1.0
             flowLayout.minimumInteritemSpacing = 1.0
             collectionView.collectionViewLayout = flowLayout


             // Register Header
             collectionView.register(StretchyCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
         }
     }
 
     extension CollectionView: UICollectionViewDataSource {
         func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                 if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as? StretchyCollectionHeaderView {
                     // Add Image to the Header
                     headerView.imageView.image = UIImage(named: "headerbg")
                     
                     return headerView
                 }
                 return UICollectionReusableView()
         }
     }
 
     extension CollectionView: UICollectionViewDelegateFlowLayout {
         func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
             return CGSize(width: self.collectionView.frame.size.width, height: 250)
         }
     }
    ```
 */

