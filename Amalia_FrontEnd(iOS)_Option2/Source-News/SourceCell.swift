//
//  SourceCell.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import UIKit

final class SourceCell: UITableViewCell {
    static let REUSE_IDENTIFIER = String(describing: SourceCell.self)
    
    private var sourceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private var sourceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(sourceTitleLabel)
        contentView.addSubview(sourceDescriptionLabel)
        
        NSLayoutConstraint.activate([
            sourceTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sourceTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            sourceTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            sourceDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sourceDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            sourceDescriptionLabel.topAnchor.constraint(equalTo: sourceTitleLabel.bottomAnchor, constant: 8),
            sourceDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support Storyboard initializations")
    }
    
    func setupContents(_ source: SourceResultEntity) {
        sourceTitleLabel.text = source.name ?? "-"
        sourceDescriptionLabel.text = source.description ?? "-"
    }
}
