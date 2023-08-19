//
//  RecommendCollectionReusableView.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/16.
//

import UIKit

class RecommendCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var hotButton: UIButton!
    
    override func awakeFromNib() {
        hotButton.backgroundColor = .white
        hotButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        hotButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        hotButton.layer.cornerRadius = 10
        hotButton.layer.masksToBounds = true
    }
}
