//
//  FeedViewController.swift
//  Navigation
//
//  Created by book on 19.05.2023.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
        button.setTitle("Кнопка", for: .normal)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        view.addSubview(button)
        // Do any additional setup after loading the view.
    }
    @objc func clickButton() {
        let post = Post(title: "Заголовок")
        let postController = PostViewController()
        postController.post = post
        navigationController?.pushViewController(postController, animated: true)
    }
}

