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
        let imageView = TikkleImageView(image: UIImage(systemName: "person"))
        imageView.tintColor = .green
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(tikkleBackgoundImageView)
        
        tikkleBackgoundImageView.translatesAutoresizingMaskIntoConstraints = false
        tikkleBackgoundImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tikkleBackgoundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tikkleBackgoundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        tikkleBackgoundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
