//
//  View.swift
//  Navigation
//
//  Created by book on 27.11.2023.
//

import UIKit

class View: UIViewController {
    private let oneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "Color")
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.masksToBounds = true
        return textField
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .blue
        
        return scrollView
    }()
    private let contentView: UIView = {
        let contentView = UIView()
        
        contentView.backgroundColor = .systemGray
        return contentView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }
}
    private extension View {
        
        @objc func keyboardWillShow(notification: NSNotification) {
            let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            let keyboardHeight = keyboardFrame.height
            
            UIView.animate(withDuration: 0.25) {
                self.scrollView.contentInset.bottom = keyboardHeight
                self.view.layoutIfNeeded()
            }
        }
        
        @objc func keyboardWillHide(notification: NSNotification) {
            UIView.animate(withDuration: 0.25) {
                self.scrollView.contentInset.bottom = 0
                self.view.layoutIfNeeded()
            }
        }
        
        
        func setupConstraints() {
            view.addSubview(scrollView)
            contentView.addSubview(oneTextField)
            scrollView.addSubview(contentView)
            
            [scrollView, oneTextField, contentView].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
            NSLayoutConstraint.activate([
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                
                oneTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                oneTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                oneTextField.heightAnchor.constraint(equalToConstant: 100),
                oneTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
                oneTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 300),
                
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
        }
        
        
        
        
        
    }

