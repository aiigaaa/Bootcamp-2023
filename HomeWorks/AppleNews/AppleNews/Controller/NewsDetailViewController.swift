//
//  NewsDetailViewController.swift
//  AppleNews
//
//  Created by aiga.bernane on 20/11/2023.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var selectedArticle: Article?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Optima", size: 24)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineBreakMode = .byWordWrapping
        return textView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateData()
    }
    private func setupUI() {
        view.backgroundColor = .white
        title = "News Detail"
        
        view.addSubview(titleLabel)
        view.addSubview(contentTextView)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-16)
        ])
        
        NSLayoutConstraint.activate([
            contentTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-16),
            contentTextView.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-16),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    
    }
    private func populateData(){
        guard let article = selectedArticle else {return}
        
        titleLabel.text = article.title
        contentTextView.text = article.content
        imageView.sd_setImage(with: URL(string: article.urlToImage ?? ""), placeholderImage: UIImage(named: "placeholder_image"))
    }
    
    
}
