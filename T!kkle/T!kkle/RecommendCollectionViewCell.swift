//
//  RecommendCollectionViewCell.swift
//  T!kkle
//
//  Created by 김도현 on 2023/08/14.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "\(RecommendCollectionViewCell.self)"
    let tikkleBackgoundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.tintColor = .green
        return imageView
    }()
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = .body3Bold
        lb.text = "테스트"
        lb.textColor = .white
        return lb
    }()
    let challengeCountLabel: UILabel = {
        let lb = UILabel()
        lb.font = .body5
        lb.text = "n명째 도전중"
        lb.textColor = .white
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(tikkleBackgoundImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(challengeCountLabel)
        
        backgroundImageGradient()
        
        tikkleBackgoundImageView.translatesAutoresizingMaskIntoConstraints = false
        tikkleBackgoundImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tikkleBackgoundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tikkleBackgoundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        tikkleBackgoundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: tikkleBackgoundImageView.leadingAnchor, constant: 10).isActive = true
        
        challengeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        challengeCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        challengeCountLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        challengeCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
    }
    
    private func backgroundImageGradient() {
        let startColor = UIColor(red: 30/255, green: 113/255, blue: 79/255, alpha: 0).cgColor
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = contentView.bounds
        
        gradientLayer.colors = [startColor, endColor]
        
        contentView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
