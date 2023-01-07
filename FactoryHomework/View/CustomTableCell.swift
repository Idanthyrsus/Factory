//
//  CustomCell.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 03.12.2022.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    static let cellId = "CustomCell"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var genusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var caloriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sugarLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .white
        setupLabels()
    }
    
    private func setupLabels() {
        
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(genusLabel)
        self.contentView.addSubview(caloriesLabel)
        self.contentView.addSubview(sugarLabel)
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: self.genusLabel.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            
            genusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor),
            genusLabel.bottomAnchor.constraint(equalTo: self.caloriesLabel.topAnchor),
            genusLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            
            caloriesLabel.topAnchor.constraint(equalTo: self.genusLabel.bottomAnchor),
            caloriesLabel.bottomAnchor.constraint(equalTo: self.sugarLabel.topAnchor),
            caloriesLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            
            sugarLabel.topAnchor.constraint(equalTo: self.caloriesLabel.bottomAnchor),
            sugarLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            sugarLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        ])
        
    }
    
}
