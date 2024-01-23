//
//  ProfileViewController.swift
//  Navigation
//
//  Created by book on 19.05.2023.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
	private lazy var tableView: UITableView = {
		let tableView = UITableView.init(
			frame: .zero,
			style: .grouped
		)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		return tableView
	}()
	private lazy var headerView = ProfileHeaderView()
    private let posts = Post.make()
	private let cellReuseIdentifier = "PostTableViewCell"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        setups()
    }
}
extension ProfileViewController: UITableViewDelegate {
    
}
extension ProfileViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: cellReuseIdentifier,
			for: indexPath
		) as? PostTableViewCell
		guard let postCell = cell else {
			fatalError("could not dequeueReusableCell")
		}
		postCell.configuration(post: posts[indexPath.row])
		return postCell
	}
	
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		headerView
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		UITableView.automaticDimension
	}
	
}
private extension ProfileViewController {
    
    func setups() {
		#if DEBUG
        view.backgroundColor = .blue
		#else
		view.backgroundColor = .brown
		#endif
        navigationController?.navigationBar.backgroundColor = .white
        title = "Profile"
		tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
		tableView.allowsSelection = false
		tableView.register(
			PostTableViewCell.self,
			forCellReuseIdentifier: cellReuseIdentifier
		)
		tableView.reloadData()
    }
    
    func addSubviews() {
        view.addSubview(tableView)
		
		#if DEBUG
		view.backgroundColor = .blue
		#else
		view.backgroundColor = .brown
		#endif
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
