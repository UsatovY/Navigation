//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by book on 26.05.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String?
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.image = UIImage(named: "photo_2023-09-26_04-57-13")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 60
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.text = "Hipster cat"
        return view
    }()
    private lazy var statusButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .systemBlue
        view.setTitle("Show Status", for: .normal)
        view.layer.cornerRadius = 4
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .init(width: 4, height: 4)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4
        view.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return view
    }()
    private lazy var text: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.text = "Waiting for something..."
        view.textColor = .gray
        return view
    }()
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 12
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        view.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProfileHeaderView {
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    @objc func buttonPressed() {
        if let statusText, !statusText.isEmpty {
            text.text = statusText
        }
    }
    
    func addSubviews() {
        addSubview(image)
        addSubview(titleLabel)
        addSubview(statusButton)
        addSubview(text)
        addSubview(textField)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 120),
            image.widthAnchor.constraint(equalToConstant: 120),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            statusButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 56),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
			statusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -50),
            textField.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            text.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -112),
            text.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    ])
}
}
