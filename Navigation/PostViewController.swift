//
//  PostViewController.swift
//  Navigation
//
//  Created by book on 19.05.2023.
//

import UIKit
import StorageService

class PostViewController: UIViewController {
    var post: Post?
    override func viewDidLoad() {
        super.viewDidLoad()

        title = post?.title
        view.backgroundColor = .red
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(clickInfo))
    }
    @objc func clickInfo() {
        let info = InfoViewController()
        present(info, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
