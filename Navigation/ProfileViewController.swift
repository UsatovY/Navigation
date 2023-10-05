//
//  ProfileViewController.swift
//  Navigation
//
//  Created by book on 19.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var header: ProfileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        view.addSubview(header)
        navigationController?.navigationBar.backgroundColor = .white
        title = "Profile" 
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        header.frame = CGRect(
            x: view.frame.minX + view.safeAreaInsets.left,
            y: view.frame.minY + view.safeAreaInsets.top,
            width: view.frame.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
            height: view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        )
    }
}
