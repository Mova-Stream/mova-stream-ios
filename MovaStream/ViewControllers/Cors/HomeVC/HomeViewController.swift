//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit
import SwiftUI


class HomeViewController: MasterViewController {
    
    // MARK: - Variables
    private let rowData: [RowMovieCellModel] = {
        return tmdbs
    }()
    
    // TableView
    private var homeTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .greyDark
        table.register(RowForCardMovieTableViewCell.self, forCellReuseIdentifier: RowForCardMovieTableViewCell.identifier)
        table.refreshControl?.addTarget(HomeViewController.self, action: #selector(reloadData), for: .valueChanged)
        table.tableHeaderView = HomeViewHeader(frame: CGRect(x: 0, y: 0, width: UIScreen.size.width, height: 350))
        return table
    }()
    
    // Section view
    private func rowSectionHeader(_ sectionTitle: String) -> UIView {
        let view = UIView()
        let titleLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 80)))
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = sectionTitle
        let seeAllBtn = MButton(type: .custom)
        seeAllBtn.setTitle("See all", font: .medium(size: 14), textColor: .primaryRed, for: .normal)
        view.insertSubview(titleLabel, at: 0)
        view.insertSubview(seeAllBtn, at: 1)
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, constant: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        seeAllBtn.anchor(top: view.topAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, constant: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20))
        return view
    }
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    // ViewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupLayouts()
    }
    
    // Setup view
    private func setupViews() {
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.view.insertSubview(self.homeTableView, at: 0)
        self.reloadData()
    }
    
    // Setup layouts
    private func setupLayouts() {
        homeTableView.fillSuperview(superview: self.view)
    }
    
    // Reload data or call api..
    @objc private func reloadData() {
        print("Data loading...")
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // willDisplayHeaderView
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .textColor
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    // numberOfSections
    func numberOfSections(in tableView: UITableView) -> Int {
        return tmdbs.count
    }
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RowForCardMovieTableViewCell.identifier, for: indexPath) as? RowForCardMovieTableViewCell else {
            return UITableViewCell()
        }
        cell.setDataRow(model: tmdbs[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return rowSectionHeader(rowData[section].rowName)
    }
    
    // heightForHeaderInSection
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension HomeViewController {
    
    // scrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let headerView = self.homeTableView.tableHeaderView as? HomeViewHeader {
            headerView.stretchyHeader.scrollViewDidScroll(scrollView: scrollView)
        }
    }
    
}

import SwiftUI

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: HomeViewController())
    }
}
