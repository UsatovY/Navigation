//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by book on 06.01.2024.
//

import UIKit
import StorageService

class PostTableViewCell: UITableViewCell {
    
    private lazy var authorLable: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.textColor = .black
        view.numberOfLines = 2
        return view
    }()
    private lazy var descriptionLable: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = .systemGray
        view.numberOfLines = 0
        return view
    }()
    private lazy var postImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        return view
    }()
    private lazy var likesLable: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        return view
    }()
    private lazy var viewsLable: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        view.textAlignment = .right
        return view
    }()
	
	func configuration(post: Post) {
		authorLable.text = post.author
		descriptionLable.text = post.description
		postImageView.image = UIImage(named: post.image)
		likesLable.text = "Likes: \(post.likes)"
		viewsLable.text = "Views: \(post.views)"
	}
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension PostTableViewCell {
    func addSubviews() {
            [authorLable, descriptionLable, postImageView, likesLable, viewsLable].forEach {
                contentView.addSubview($0)
            }
        }
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                authorLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                authorLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                authorLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                authorLable.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: -12),

                postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
                postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),

                descriptionLable.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
                descriptionLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                descriptionLable.bottomAnchor.constraint(equalTo: likesLable.topAnchor, constant: -16),
				descriptionLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

                likesLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                likesLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                likesLable.trailingAnchor.constraint(equalTo: viewsLable.leadingAnchor),

                viewsLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                viewsLable.topAnchor.constraint(equalTo: likesLable.topAnchor),
                viewsLable.bottomAnchor.constraint(equalTo: viewsLable.bottomAnchor)
            ])
        }
    }
