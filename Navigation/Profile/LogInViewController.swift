//
//  LogInViewController.swift
//  Navigation
//
//  Created by book on 19.10.2023.
//

import UIKit

final class LoginViewController: UIViewController {
            
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        
        return scrollView
    }()
    private let contentView: UIView = {
        let contentView = UIView()
        
        return contentView
    }()
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "Color")
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        return textField
    }()
	private let loginPasswordStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.layer.cornerRadius = 10
		stackView.layer.masksToBounds = true
		stackView.layer.borderColor = UIColor.lightGray.cgColor
		stackView.layer.borderWidth = 0.5
		stackView.axis = .vertical
		return stackView
	}()
	private let spliterTextField: UIView = {
		let spliter = UIView()
		spliter.backgroundColor = .lightGray
		return spliter
	}()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.backgroundColor = .systemGray6
        
        return textField
    }()
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel")?.alpha(0.8), for: .selected)
        button.setBackgroundImage(UIImage(named: "blue_pixel")?.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "blue_pixel")?.alpha(0.8), for: .disabled)
		button.layer.cornerRadius = 10
		button.layer.masksToBounds = true
        return button
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
        navigationController?.navigationBar.isHidden = true
        
        setupConstraints()
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)

    }
}

private extension LoginViewController {
    
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
    
    @objc func login() {
        let profileController = ProfileViewController()
        navigationController?.pushViewController(profileController, animated: true)
    }
    
    func setupConstraints() {
        view.addSubview(scrollView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginPasswordStackView)
        contentView.addSubview(loginButton)
        scrollView.addSubview(contentView)
		loginPasswordStackView.addArrangedSubview(emailTextField)
		loginPasswordStackView.addArrangedSubview(spliterTextField)
		loginPasswordStackView.addArrangedSubview(passwordTextField)
        
        [logoImageView, emailTextField, passwordTextField, loginButton, scrollView, contentView, loginPasswordStackView, spliterTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
			
			loginPasswordStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			loginPasswordStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			loginPasswordStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
			
			spliterTextField.heightAnchor.constraint(equalToConstant: 0.5),
			
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.topAnchor.constraint(equalTo: loginPasswordStackView.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension UIImage {
    
    // Прозрачность картинки
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
