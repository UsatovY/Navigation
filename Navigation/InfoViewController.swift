//
//  InfoViewController.swift
//  Navigation
//
//  Created by book on 19.05.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
            button.setTitle("Кнопка", for: .normal)
            button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
            view.addSubview(button)
        }
        @objc func clickButton() {
            let alert = UIAlertController(title: "Недостаточно места", message: "Продолжить?", preferredStyle: .alert)
             
            alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { _ in
                print("Да")
            }))
            alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { _ in
                print("Нет")
            }))
             
            present(alert, animated: true)
        }
}
