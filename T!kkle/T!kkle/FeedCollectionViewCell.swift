//
//  FeedCollectionViewCell.swift
//  T!kkle
//
//  Created by 김도현 on 2023/08/14.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "\(FeedCollectionViewCell.self)"
    var tikkleImageView: UIImageView = UIImageView(image: UIImage(systemName: "person"))
    var tikkleTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "티끌 타이틀"
        lb.font = .systemFont(ofSize: 14, weight: .regular)
        lb.textColor = .green
        return lb
    }()
    var likeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(tikkleImageView)
        contentView.addSubview(tikkleTitleLabel)
        contentView.addSubview(likeButton)
        
        likeButton.addTarget(self, action: #selector(likeClick), for: .touchUpInside)
        
        tikkleImageView.translatesAutoresizingMaskIntoConstraints = false
        tikkleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        tikkleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        tikkleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        
        tikkleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tikkleTitleLabel.topAnchor.constraint(equalTo: tikkleImageView.bottomAnchor, constant: 8).isActive = true
        tikkleTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tikkleTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.centerYAnchor.constraint(equalTo: tikkleTitleLabel.centerYAnchor, constant: 8).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: tikkleTitleLabel.trailingAnchor, constant: -8).isActive = true
        likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likeClick() {
        likeButton.isSelected = !likeButton.isSelected
    }
    
}
