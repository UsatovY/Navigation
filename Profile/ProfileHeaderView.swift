//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by book on 26.05.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String?
    private var image = UIImageView()
    private var titleLabel = UILabel()
    private var statusButton = UIButton()
    private var text = UILabel()
    private var textField = UITextField()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(image)
        addSubview(titleLabel)
        addSubview(statusButton)
        addSubview(text)
        addSubview(textField)
        statusButton.backgroundColor = .systemBlue
        titleLabel.text = "Hipster cat"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        text.text = "Waiting for something..."
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        statusButton.setTitle("Show Status", for: .normal)
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = .init(width: 4, height: 4)
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowRadius = 4
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.image = UIImage(named: "photo_2023-09-26_04-57-13")
        image.layer.masksToBounds = true
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        image.frame = CGRect(x: 16, y: 16, width: 120, height: 120)
        titleLabel.frame = CGRect(x: image.frame.maxX + 16, y: 27, width: 200, height: 20)
        statusButton.frame = CGRect(
            x: 16,
            y: image.frame.maxY + 16,
            width: UIScreen.main.bounds.width - 32,
            height: 50
        )
        text.frame = CGRect(
            x: titleLabel.frame.origin.x,
            y: statusButton.frame.minY - 72,
            width: 200,
            height: 18
        )
        image.layer.cornerRadius = image.frame.height * 0.5
        textField.frame = CGRect(
            x: titleLabel.frame.origin.x,
            y: statusButton.frame.minY - 50,
            width: 200,
            height: 40
        )
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    @objc func buttonPressed() {
        if let statusText, !statusText.isEmpty {
            text.text = statusText
        }
    }
}

