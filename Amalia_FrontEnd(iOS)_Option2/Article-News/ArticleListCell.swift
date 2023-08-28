//
//  ArticleListCell.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 28/08/23.
//

import UIKit

final class ArticleListCell: UITableViewCell {
    static let REUSE_IDENTIFIER = String(describing: ArticleListCell.self)
    
    private var articleTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private var articleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(articleTitleLabel)
        contentView.addSubview(articleDescriptionLabel)
        
        NSLayoutConstraint.activate([
            articleTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            articleTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            articleTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            articleDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            articleDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            articleDescriptionLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 8),
            articleDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support Storyboard initializations")
    }
    
    func setupContents(_ article: ArticleResultEntity) {
        articleTitleLabel.text = article.title ?? ""
        articleDescriptionLabel.text = article.description ?? ""
    }
}

