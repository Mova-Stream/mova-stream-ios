//
//  DownloadViewController.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit

class DownloadViewController: MasterViewController {
    
    // MARK: - Variables
    private let movies: [Movie] = {
        return tmdbs[0].movies
    }()
    
    // TableView
    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.separatorColor = .clear
        table.register(CardMovieTableViewCell.self, forCellReuseIdentifier: CardMovieTableViewCell.identifier)
        table.refreshControl?.addTarget(DownloadViewController.self, action: #selector(reloadData), for: .valueChanged)
        return table
    }()
    
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
        self.tableView.frame = view.bounds
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.insertSubview(self.tableView, at: 0)
        self.reloadData()
    }
    
    // Setup layouts
    private func setupLayouts() {
        tableView.fillSuperview(superview: self.view)
    }
    
    // Reload data or call api..
    @objc private func reloadData() {
        print("Data loading...")
    }
    
    private func removeMovieAt(indexPath: IndexPath) {
        print("Item index at: " + indexPath.description)
    }
}


extension DownloadViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movies.count
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil) {[weak self] _ in
                let removeAction = UIAction(title: "Remove", subtitle: nil, image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                    self?.removeMovieAt(indexPath: indexPath)
                }
                return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [removeAction])
            }
        
        return config
    }
    
    // MARK: - DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardMovieTableViewCell.identifier, for: indexPath) as? CardMovieTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCellWith(with: movies[indexPath.row])
        return cell
    }
}

import SwiftUI

struct DownloadVC_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: DownloadViewController())
    }
}

