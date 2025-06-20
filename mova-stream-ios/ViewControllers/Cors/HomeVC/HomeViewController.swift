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
    
    // MARK: - IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewTopAnchor: NSLayoutConstraint!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerSubTitleLabel: UILabel!
    @IBOutlet weak var headerPlayButtonView: UIView!
    @IBOutlet weak var headerMyListButtonView: UIView!
    
    // Section Top 10 Movies This Week
    @IBOutlet weak var sectionView1: UIStackView!
    @IBOutlet weak var sectionTitleLabel1: UILabel!
    @IBOutlet weak var sectionSeeAllButton1: UIButton!
    @IBOutlet weak var sectionCollectionView1: UICollectionView!
    
    // Section New Releases
    @IBOutlet weak var sectionView2: UIStackView!
    @IBOutlet weak var sectionTitleLabel2: UILabel!
    @IBOutlet weak var sectionSeeAllButton2: UIButton!
    @IBOutlet weak var sectionCollectionView2: UICollectionView!
    
    
    
    // MARK: - ViewModel
    // Define any ViewModel properties if needed
    
    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationLargeTitle(false)
        self.setNavigationBarBackgroundColor(.clear)
        let effect = UIBlurEffect(style: .dark)
        self.setNavigationBarBackgroundBlurWhenScroll(effect)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.updateLayoutConstraint()
    }
}

// MARK: - Actions
extension HomeViewController {
    
    @objc private func didTapPlay() {
        // Handle right bar item tap
        NSLog("Play tapped")
    }
    
    @objc private func didTapMyList() {
        // Handle right bar item tap
        NSLog("My list tapped")
    }
    
    @objc private func didTapSearchBarItem() {
        // Handle left bar item tap
        NSLog("Search bar item tapped")
    }
    
    @objc private func didTapBellBarItem() {
        // Handle right bar item tap
        NSLog("Bell bar item tapped")
    }
    
    @IBAction private func didTapSeeAllSection1() {
        // Handle right bar item tap
        NSLog("Did tap see all section 1")
    }
    
    @IBAction private func didTapSeeAllSection2() {
        // Handle right bar item tap
        NSLog("Did tap see all section 2")
    }

}


// MARK: - Setup UI
extension HomeViewController {

    private func setupUI() {
        self.setupNavigationBarItem()
        self.setupHeaderView()
        
        // Setup Section 1
    }
    
    private func setupHeaderView() {
        self.headerImageView.image = UIImage(named: "doctor_strange2")
        self.headerTitleLabel.text = "This is title of movie"
        self.headerSubTitleLabel.text = "This is subtitle of movie"
        
        let playButton = UKButton(model: ButtonVM {
            $0.title = "Play"
            $0.imageSrc = ButtonVM.ImageSource.local("ic_play_fill", bundle: nil)
            $0.imageRenderingMode = .template
            $0.color = ComponentColor(
                main: .universal(.uiColor(.mainColor)),
                contrast: .universal(.uiColor(.white))
            )
            $0.style = .filled
            $0.cornerRadius = .full
            $0.size = .small
        }, action: didTapPlay)
        
        let myListButton = UKButton(model: ButtonVM {
            $0.title = "My List"
            $0.imageSrc = ButtonVM.ImageSource.local("ic_plus_no_outline", bundle: nil)
            $0.imageRenderingMode = .template
            $0.color = ComponentColor(main: .white, contrast: .clear)
            $0.style = .bordered(.large)
            $0.cornerRadius = .full
            $0.size = .small
        }, action: didTapMyList)
        
        self.headerPlayButtonView.backgroundColor = .clear
        self.headerPlayButtonView.addSubview(playButton)
        playButton.allEdges()
        
        self.headerMyListButtonView.backgroundColor = .clear
        self.headerMyListButtonView.addSubview(myListButton)
        myListButton.allEdges()
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
            $0.style = .plain
        }, action: didTapSearchBarItem)
        
        let bellButton = UKButton(model: ButtonVM {
            $0.title = ""
            $0.imageSrc = ButtonVM.ImageSource.local("ic_bell", bundle: nil)
            $0.imageRenderingMode = .template
            $0.color = ComponentColor(main: .white, contrast: .clear)
            $0.style = .plain
        }, action: didTapBellBarItem)
                
        self.setLeftBarItem(view: logoButton)
        self.setRightBarItems([bellButton, searchButton])
        
    }
    
    private func updateLayoutConstraint() {
        guard let headerViewTopAnchor = self.headerViewTopAnchor else { return }
        let size = self.navigationBarHeight + self.statusBarHeight
        headerViewTopAnchor.constant -= size
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150) // Adjust size as needed
    }
    
}

